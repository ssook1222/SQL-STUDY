### 1.

```sql
SELECT name, caution
FROM student
order by caution desc;
```

### 2.

```sql
SELECT name, caution
FROM student
WHERE name = 'Dodo';

DELETE  FROM student
        WHERE name = 'Dodo';

SELECT *
FROM student
```

### 3.

```sql
SELECT name, grade
FROM student
WHERE name LIKE '%pi%'
```

### 4.

```sql
SELECT      room
            , count(*)
FROM        student
group by    room
```

### 5.

```sql
SELECT      room
FROM        student
GROUP BY    room
HAVING      count(*) = 1
```