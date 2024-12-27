# 12월 5주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

### 입양 시각 구하기(1)

```sql
SELECT HOUR(DATETIME) AS HOUR,
       COUNT(*) AS COUNT
FROM ANIMAL_OUTS
WHERE HOUR(DATETIME) BETWEEN 9 AND 19
GROUP BY HOUR(DATETIME)
ORDER BY HOUR;
```

### 가격대 별 상품 개수 구하기

```sql
SELECT 
    LEFT(PRICE, 1) * 10000 AS PRICE_GROUP,
    COUNT(LEFT(PRICE, 1)) AS PRODUCTS
FROM PRODUCT
GROUP BY LEFT(PRICE, 1)
ORDER BY LEFT(PRICE, 1);
```

### 자동차 대여 기록에서 대여중 / 대여 가능 여부 구분하기

```sql
WITH TEST AS (
    SELECT CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE STR_TO_DATE('2022-10-16', '%Y-%m-%d') BETWEEN START_DATE AND END_DATE
)
SELECT DISTINCT 
       C.CAR_ID,
       CASE 
           WHEN TEST.CAR_ID IS NULL THEN '대여 가능'
           WHEN TEST.CAR_ID IS NOT NULL THEN '대여중'
       END AS AVAILABILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY C
LEFT JOIN TEST ON C.CAR_ID = TEST.CAR_ID
ORDER BY C.CAR_ID DESC;

```