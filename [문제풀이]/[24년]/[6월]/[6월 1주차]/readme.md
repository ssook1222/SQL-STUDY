# 6월 1주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** Leetcode

### Find Followers Count

```sql
SELECT      F1.USER_ID
            , COUNT(F1.FOLLOWER_ID) AS FOLLOWERS_COUNT
FROM        FOLLOWERS F1 
GROUP BY    F1.USER_ID 
ORDER BY    F1.USER_ID ASC
```

### Biggest Single Number

```sql
WITH RAW AS (
    SELECT MAX(NUM) AS NUM
    FROM MYNUMBERS
    GROUP BY NUM
    HAVING COUNT(NUM) = 1
)

SELECT MAX(NUM) AS NUM
FROM RAW
```

### Primary Department For Each Employee

```sql
(
    SELECT EMPLOYEE_ID, DEPARTMENT_ID
    FROM EMPLOYEE
    WHERE PRIMARY_FLAG = 'Y'
)

UNION

(
    SELECT EMPLOYEE_ID
        , DEPARTMENT_ID
    FROM EMPLOYEE
    GROUP BY EMPLOYEE_ID
    HAVING COUNT(*) = 1
    ORDER BY 1
)
```