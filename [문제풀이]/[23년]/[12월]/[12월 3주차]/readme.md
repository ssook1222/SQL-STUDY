# 12월 3주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** SQLBolt

---
### For each role, find the average number of years employed by employees in that role

```sql
SELECT      ROLE
            , AVG(YEARS_EMPLOYED) AS AVG
FROM        EMPLOYEES
GROUP BY    ROLE
```

### Find the total number of employee years worked in each building

```sql
SELECT      BUILDING,
            SUM(YEARS_EMPLOYED) AS SUM
FROM        EMPLOYEES
GROUP BY    BUILDING
```

### Find the number of Artists in the studio (without a **HAVING** clause)

```sql
SELECT COUNT(*) AS ARTIST 
FROM EMPLOYEES
WHERE ROLE = 'Artist'
GROUP BY ROLE;
```

### Find the number of Employees of each role in the studio

```sql
SELECT  ROLE, 
        BUILDING, 
        COUNT(NAME)
FROM EMPLOYEES
GROUP BY ROLE, BUILDING;
```

### Find the total number of years employed by all Engineers

```sql
SELECT  SUM(YEARS_EMPLOYED) AS SUM
FROM EMPLOYEES
WHERE ROLE = 'Engineer'
GROUP BY ROLE;
```