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
