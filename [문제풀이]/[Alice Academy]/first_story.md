### 1

```sql
-- 아래에 쿼리를 작성해 보세요.

SELECT *
FROM student
```

### 2

```sql
-- 아래에 쿼리를 작성해 보세요.

UPDATE student SET grade = grade + 1;

SELECT *
FROM student
```

### 3

```sql
-- 아래에 쿼리를 작성해 보세요.

INSERT INTO student VALUES (1005, 'Alice', 1, 104) ;
INSERT INTO student VALUES (1006, 'Bob', 1, 104) ;
INSERT INTO student VALUES (1007, 'Charles', 1, 105);

SELECT *
FROM student
WHERE id >= 1005
```

### 4

```sql
-- 아래에 쿼리를 작성해 보세요.

ALTER TABLE student
ADD COLUMN caution int DEFAULT 0;

SELECT caution
FROM student
```

### 5

```sql
-- 아래에 쿼리를 작성해 보세요.

UPDATE student SET caution = caution + 1 WHERE grade = 3;

SELECT *
FROM student
WHERE caution >= 1
```