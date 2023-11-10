# 11월 2주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

`문제 플랫폼`    
 LeetCode

### 1873. Calculate Special Bonus

```sql
SELECT  EMPLOYEE_ID
        , CASE  WHEN MOD(EMPLOYEE_ID, 2) = 0 THEN 0
                WHEN NAME LIKE 'M%' THEN 0
                ELSE SALARY 
        END AS BONUS
FROM    EMPLOYEES
ORDER BY EMPLOYEE_ID
```

### 1517. Find Users With Valid E-Mails

```sql
SELECT  USER_ID, NAME, MAIL
FROM    USERS
WHERE   INSTR(MAIL, '@leetcode.com') 
        AND MAIL REGEXP '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode.com$'
```

### 1978. Employees Whose Manager Left the Company

```sql
WITH C AS (
    SELECT employee_id, manager_id
    FROM Employees
    WHERE salary < 30000 
        AND manager_id IS NOT NULL
)

SELECT employee_id
FROM C
WHERE NOT EXISTS (
    SELECT 1 
    FROM Employees
    WHERE employee_id = C.manager_id
)
ORDER BY employee_id;
```