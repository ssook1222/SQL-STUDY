# 6월 4주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** Leetcode

### 1484. Group Sold Products By The Date

```sql
SELECT  SELL_DATE
        , COUNT(DISTINCT PRODUCT) AS NUM_SOLD
        , GROUP_CONCAT(DISTINCT PRODUCT ORDER BY PRODUCT SEPARATOR ',') AS PRODUCTS
FROM    ACTIVITIES
GROUP BY SELL_DATE
ORDER BY SELL_DATE;
```

### 1327. List the Products Ordered in a Period

```sql
SELECT      P.PRODUCT_NAME
            , SUM(O.UNIT) AS UNIT
FROM        PRODUCTS P  JOIN ORDERS O ON P.PRODUCT_ID = O.PRODUCT_ID
WHERE       O.ORDER_DATE BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY    P.PRODUCT_NAME
HAVING      SUM(O.UNIT) >= 100;
```

### 1517. Find Users With Valid E-Mails

```sql
SELECT  USER_ID
        , NAME
        , MAIL
FROM    USERS
WHERE   MAIL REGEXP '^[A-Za-z][A-Za-z0-9._-]*@leetcode\\.com$';
```