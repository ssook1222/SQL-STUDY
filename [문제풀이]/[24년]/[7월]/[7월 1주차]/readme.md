# 7월 1주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** Leetcode

### 1174. Immediate Food Delivery II

```sql
SELECT
    ROUND(
        SUM(
            CASE 
                WHEN D.ORDER_DATE = D.CUSTOMER_PREF_DELIVERY_DATE THEN 1
                ELSE 0 
            END
        ) / COUNT(*) * 100, 2
    ) AS IMMEDIATE_PERCENTAGE
FROM
    (SELECT
         DELIVERY_ID,
         CUSTOMER_ID,
         ORDER_DATE,
         CUSTOMER_PREF_DELIVERY_DATE
     FROM
         DELIVERY D1
     WHERE
         D1.ORDER_DATE = (
             SELECT MIN(D2.ORDER_DATE)
             FROM DELIVERY D2
             WHERE D2.CUSTOMER_ID = D1.CUSTOMER_ID
         )
    ) D;

```

### 550. Game Play Analysis IV

```sql
WITH FIRST_LOGIN AS (
    SELECT
        PLAYER_ID,
        MIN(EVENT_DATE) AS FIRST_LOGIN_DATE
    FROM
        ACTIVITY
    GROUP BY
        PLAYER_ID
),
CONSECUTIVE_LOGIN AS (
    SELECT
        FL.PLAYER_ID
    FROM
        FIRST_LOGIN FL
    JOIN
        ACTIVITY A
    ON
        FL.PLAYER_ID = A.PLAYER_ID
        AND A.EVENT_DATE = DATE_ADD(FL.FIRST_LOGIN_DATE, INTERVAL 1 DAY)
)
SELECT
    ROUND(
        COUNT(CL.PLAYER_ID) / COUNT(DISTINCT FL.PLAYER_ID), 2
    ) AS FRACTION
FROM
    FIRST_LOGIN FL
LEFT JOIN
    CONSECUTIVE_LOGIN CL
ON
    FL.PLAYER_ID = CL.PLAYER_ID;

```

### 1045. Customers Who Bought All Products

```sql
SELECT DISTINCT
    customer_id
FROM
    Customer
GROUP BY
    customer_id
HAVING
    COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product);

```