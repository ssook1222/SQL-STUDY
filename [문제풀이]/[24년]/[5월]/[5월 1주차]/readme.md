
# 5월 1주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** Leetcode

### Articles Views I

```sql
SELECT      AUTHOR_ID AS ID
FROM        VIEWS
WHERE       AUTHOR_ID = VIEWER_ID
GROUP BY    AUTHOR_ID
ORDER BY    AUTHOR_ID
```

### Invalid Tweets

```sql
SELECT      TWEET_ID
FROM        TWEETS
WHERE       LENGTH(CONTENT) > 15
```

### Replace employee id with the unique identifier

```sql
SELECT      B.UNIQUE_ID
            , A.NAME
FROM        EMPLOYEES A LEFT OUTER JOIN EMPLOYEEUNI B
            ON A.ID = B.ID
```

