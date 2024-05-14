
# 5월 3주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** Leetcode

### Average Time of Process per Machine

```sql
WITH 
START AS (
    SELECT MACHINE_ID, PROCESS_ID, TIMESTAMP
    FROM ACTIVITY
    WHERE ACTIVITY_TYPE = 'START'
),
END AS (
    SELECT MACHINE_ID, PROCESS_ID, TIMESTAMP
    FROM ACTIVITY
    WHERE ACTIVITY_TYPE = 'END'
),

DIFF AS (
    SELECT START.MACHINE_ID
        , END.TIMESTAMP - START.TIMESTAMP AS PROCESSING_TIME
    FROM START
    INNER JOIN END ON START.MACHINE_ID = END.MACHINE_ID 
                AND START.PROCESS_ID = END.PROCESS_ID
)

SELECT  MACHINE_ID
        , ROUND(AVG(PROCESSING_TIME), 3) AS PROCESSING_TIME
FROM    DIFF
GROUP BY MACHINE_ID
```

### Fix Names in a Table

```sql
SELECT      USER_ID
            , CONCAT(UPPER(SUBSTRING(NAME, 1, 1)),
            LOWER(SUBSTRING(NAME, 2))) AS NAME
FROM        USERS
ORDER BY    USER_ID
```

### Employee Bonus

```sql
SELECT      NAME
            , BONUS
FROM        EMPLOYEE E LEFT OUTER JOIN BONUS B
            ON E.EMPID = B.EMPID
WHERE       B.BONUS < 1000 OR B.BONUS IS NULL
```