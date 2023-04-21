## 4월 3주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 **왜** 그렇게 작성했는지 생각해보기

`문제 플랫폼`     
프로그래머스

`문제 풀이에 참여한 날짜`
- [4월 20일](#4월-20일)
- [4월 21일](#4월-21일)

## 4월 20일

### 조건에 맞는 사용자와 총 거래 금액 조회하기

```sql
SELECT  USER_ID	
        , NICKNAME	
        , SUM(B.PRICE) TOTAL_SALES
FROM    USED_GOODS_USER A INNER JOIN USED_GOODS_BOARD B
ON      B.WRITER_ID = A.USER_ID
WHERE   B.STATUS = 'DONE'
GROUP BY  NICKNAME, USER_ID
HAVING    SUM(B.PRICE) >= 700000
ORDER BY   TOTAL_SALES ASC
```

### 대여기록이 존재하는 자동차 리스트 구하기

```sql
WITH LIST AS ( 
    SELECT  CAR_ID
    FROM    CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE   EXTRACT(MONTH FROM START_DATE) = 10 
)
SELECT  A.CAR_ID
FROM    CAR_RENTAL_COMPANY_CAR A INNER JOIN LIST B
ON      A.CAR_ID = B.CAR_ID
WHERE   A.CAR_TYPE = '세단'
GROUP BY A.CAR_ID
ORDER BY A.CAR_ID DESC
```

### **가격대 별 상품 개수 구하기**

```sql
WITH BAD AS (

    SELECT SUBSTR(PRICE,0,1) PRICE_GROUP
    FROM PRODUCT
) 
SELECT
    BAD.PRICE_GROUP * 10000 PRICE_GROUP,
    COUNT(BAD.PRICE_GROUP) PRODUCTS
FROM    BAD
GROUP BY    BAD.PRICE_GROUP
ORDER BY    BAD.PRICE_GROUP
```
---

## 4월 21일

### 고양이와 개는 몇 마리 있을까

```sql
SELECT      ANIMAL_TYPE
            , COUNT(*) AS COUNT
FROM        ANIMAL_INS
GROUP BY    ANIMAL_TYPE
ORDER BY    ANIMAL_TYPE
```

### 조건에 부합하는 중고 거래 상태 조회하기

```sql
SELECT      BOARD_ID	
            , WRITER_ID	
            , TITLE	
            , PRICE	
            , CASE WHEN STATUS = 'SALE' THEN '판매중'
                   WHEN STATUS = 'RESERVED' THEN '예약중'
                   WHEN STATUS = 'DONE' THEN '거래완료' 
                   END AS STATUS
FROM         USED_GOODS_BOARD
WHERE       TO_CHAR(CREATED_DATE, 'YYYY-MM-DD') = '2022-10-05'
ORDER BY    BOARD_ID DESC
```

### 입양 시각 구하기

```sql
SELECT  TO_NUMBER(TO_CHAR(DATETIME,'HH24')) AS HOUR
        , COUNT(*) AS COUNT
FROM    ANIMAL_OUTS
WHERE   TO_NUMBER(TO_CHAR(DATETIME,'HH24')) BETWEEN 9 AND 19
GROUP BY    TO_NUMBER(TO_CHAR(DATETIME,'HH24'))
ORDER BY    HOUR
```