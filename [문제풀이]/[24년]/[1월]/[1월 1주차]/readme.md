# 1월 1주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** SQLBolt

---
### Find the name and role of all employees who have not been assigned to a building

```sql
SELECT  name,
        role
FROM employees
WHERE building isnull ;
```

### List all directors of Pixar movies (alphabetically), without duplicates

```sql
SELECT DISTINCT director
FROM movies
ORDER BY director
;
```

### List the last four Pixar movies released (ordered from most recent to least)

```sql
SELECT *
FROM movies
ORDER BY Year DESC
LIMIT 4
;
```

### List the **first** five Pixar movies sorted alphabetically

```sql
SELECT *
FROM movies
ORDER BY title
LIMIT 5
;
```

### List the **next** five Pixar movies sorted alphabetically

```sql
SELECT *
FROM movies
ORDER BY title
LIMIT 5, 5
;
```

MySQL에서는 **`LIMIT`** 절을 사용하여 특정 범위의 행을 조회할 수 있음.

해당 쿼리에서 첫 번째 매개변수는 시작하는 행의 인덱스이며, 두 번째 매개변수는 반환할 행의 수임.