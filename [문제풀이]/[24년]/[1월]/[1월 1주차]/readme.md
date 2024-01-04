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