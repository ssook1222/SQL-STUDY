
# 5월 2주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** Leetcode

### Product sales analysis1

```sql
SELECT      PRODUCT_NAME
            , YEAR
            , PRICE
FROM        SALES S INNER JOIN PRODUCT P 
            ON S.PRODUCT_ID = P.PRODUCT_ID
```

### Customer who visited but did not make any transactions

```sql
SELECT      CUSTOMER_ID
            , COUNT(*) AS COUNT_NO_TRANS
FROM        VISITS V LEFT OUTER JOIN TRANSACTIONS T 
            ON V.VISIT_ID = T.VISIT_ID
WHERE       T.VISIT_ID IS NULL
GROUP BY    CUSTOMER_ID
```

### Not boring movies

```sql
SELECT      ID
            , MOVIE
            , DESCRIPTION
            , RATING
    FROM    CINEMA
    WHERE   ID % 2 = 1 AND DESCRIPTION NOT LIKE '%boring%'
    ORDER   BY RATING DESC
```

