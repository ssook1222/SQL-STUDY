## 1월 1주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)     
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 **왜** 그렇게 작성했는지 생각해보기

`문제 플랫폼`     
프로그래머스

`문제 풀이에 참여한 날짜`
- [1월 7일](#1월-7일)
- [1월 8일](#1월-8일)

---

### 1월 7일


### 1. 오프라인/온라인 판매 데이터 통합하기

```sql
SELECT TO_CHAR(SALES_DATE,'YYYY-MM-DD') AS SALES_DATE
       , PRODUCT_ID
       , USER_ID
       , SALES_AMOUNT

FROM
    (SELECT A.SALES_DATE
           , A.PRODUCT_ID
           , A.USER_ID
           , A.SALES_AMOUNT

    FROM ONLINE_SALE A

    UNION ALL

    SELECT B.SALES_DATE
           , B.PRODUCT_ID
           , NULL AS USER_ID
           , B.SALES_AMOUNT
    FROM   OFFLINE_SALE B) C
    
    WHERE  TO_CHAR(SALES_DATE,'YYYY-MM-DD') LIKE '2022-03%'
    
ORDER BY   SALES_DATE ASC, 
           PRODUCT_ID ASC,
           USER_ID ASC
```

- UNION ALL 사용     
- 인라인 뷰를 WITH 문으로 바꿔 접근해도 나쁘지 않을 듯


---

### 2. 12세 이하인 여자 환자 목록 출력하기

```sql
SELECT  PT_NAME
        , PT_NO
        , GEND_CD
        , AGE
        , CASE 
            WHEN TLNO IS NULL THEN 'NONE'
            WHEN TLNO IS NOT NULL THEN TLNO
            END AS TLNO
FROM    PATIENT
WHERE   GEND_CD = 'W' AND AGE <= 12
ORDER BY AGE DESC, PT_NAME ASC
```

- DECODE문보다는 CASE문
- 오라클이므로 NVL 함수도 충분히 가능하겠지만, 다른 곳에서 사용할 수 있는 쿼리의 범용성을 생각해두자.    

---

### 3. 상품을 구매한 회원 비율 구하기

```sql
WITH JOIN_2021 AS (
    SELECT COUNT(DISTINCT F.USER_ID) AS JOIN
    FROM USER_INFO F
    WHERE TO_CHAR(JOINED,'YYYY-MM-DD') LIKE '2021-%'
)

,
PURCHASE_2021 AS (
    
    SELECT EXTRACT(YEAR FROM SALES_DATE) AS YEAR
           , EXTRACT(MONTH FROM SALES_DATE) AS MONTH
           , COUNT(DISTINCT N.USER_ID) AS PURCHASED_USERS
    
    FROM JOIN_2021
         , ONLINE_SALE N INNER JOIN USER_INFO F
           ON N.USER_ID = F.USER_ID 
           AND TO_CHAR(JOINED,'YYYY-MM-DD') LIKE '2021-%'
    
    GROUP BY EXTRACT(YEAR FROM SALES_DATE)
             , EXTRACT(MONTH FROM SALES_DATE)
    
    ORDER BY YEAR ASC
             , MONTH ASC

)

SELECT YEAR
       , MONTH
       , PURCHASED_USERS
       , ROUND(PURCHASED_USERS / JOIN, 1) AS PURCHASED_RATIO
FROM PURCHASE_2021, JOIN_2021
```

- **좌변 가공 금지**, `LIKE`로 바꿔 쓰기
- WITH절과 EXTRACT 사용. EXTRACT의 경우 MySQL에서도 사용 가능함!    

---

### 1월 8일

### 1. 주문량이 많은 아이스크림을 조회하기

```sql
WITH ANS AS 
(
SELECT A.FLAVOR, A.TOTAL_ORDER
FROM JULY A

UNION ALL

SELECT B.FLAVOR, B.TOTAL_ORDER
FROM FIRST_HALF B
)

SELECT FLAVOR
FROM ANS
GROUP BY FLAVOR
ORDER BY SUM(ANS.TOTAL_ORDER) DESC
FETCH NEXT 3 ROWS ONLY
```

- `FETCH` 사용해서 출력되는 행의 수를 제한하였음 (MySQL에서는 `limit`이 있음.)


### 2.저자 별 카테고리 매출액 집계하기

```sql
WITH BOOK_RES AS (
	SELECT A.AUTHOR_ID
	     , A.BOOK_ID
	     , A.CATEGORY
	     , B.SALES_DATE
	     , (B.SALES*A.PRICE) AS TOTAL_SALES
	FROM BOOK A INNER JOIN BOOK_SALES B 
	                    ON A.BOOK_ID = B.BOOK_ID
	WHERE EXTRACT(YEAR FROM B.SALES_DATE) = 2022 
	  AND EXTRACT(MONTH FROM B.SALES_DATE) = 1
)

SELECT B.AUTHOR_ID
     , B.AUTHOR_NAME
     , A.CATEGORY
     , SUM(A.TOTAL_SALES) AS TOTAL_SALES
FROM BOOK_RES A INNER JOIN AUTHOR B 
                        ON A.AUTHOR_ID = B.AUTHOR_ID
GROUP BY A.CATEGORY
       , B.AUTHOR_ID
       , B.AUTHOR_NAME
ORDER BY B.AUTHOR_ID ASC
       , A.CATEGORY DESC
```

- `EXTRACT`와 `WITH`문 사용

### 3. 조건에 맞는 도서 리스트 출력하기

```sql
SELECT BOOK_ID
       , TO_CHAR(PUBLISHED_DATE,'YYYY-MM-DD') AS PUBLISHED_DATE
FROM BOOK
WHERE CATEGORY = '인문' 
           AND EXTRACT(YEAR FROM PUBLISHED_DATE)=2021
ORDER BY PUBLISHED_DATE ASC
```

- `EXTRACT` 사용