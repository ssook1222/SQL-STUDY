# 10월 2주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

`문제 플랫폼`    
 SQLZOO

## Using Null

### **Teachers and Departments**

| id | dept | name | phone | mobile |
| --- | --- | --- | --- | --- |
| 101 | 1 | Shrivell | 2753 | 07986 555 1234 |
| 102 | 1 | Throd | 2754 | 07122 555 1920 |
| 103 | 1 | Splint | 2293 |  |
| 104 |  | Spiregrain | 3287 |  |
| 105 | 2 | Cutflower | 3212 | 07996 555 6574 |
| 106 |  | Deadyawn | 3345 |  |
| ... |  |  |  |  |

| id | name |
| --- | --- |
| 1 | Computing |
| 2 | Design |
| 3 | Engineering |
| ... |  |

---

### 23-10-08 문제풀이

### 1. List the teachers who have NULL for their department.

```sql
SELECT anme
FROM teacher
WHERE dept IS NULL
```

### 2.  Note the INNER JOIN misses the teachers with no department and the departments with no teacher.

```sql
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)
```

### 3. Use a different JOIN so that all teachers are listed.

```sql
SELECT teacher.name, dept.name
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)
```

### 4. Use a different JOIN so that all departments are listed.

```sql
SELECT teacher.name, dept.name
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)
```

---

### 23-10-09 문제풀이

### 5. Using the COALESCE function 1

```sql
SELECT NAME,
    CASE
        WHEN mobile IS NULL THEN '07986 444 2266'
        ELSE mobile
    END as mobile
FROM teacher
```

### 6. Using the COALESCE function 2

```sql
SELECT teacher.name, 
				CASE
        WHEN dept.name IS NULL THEN 'None'
        ELSE dept.name
    END as mobile
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)
```

### 7. Use COUNT to show the number of teachers and the number of mobile phones.

```sql
SELECT COUNT(name), COUNT(mobile)
  FROM teacher;
```

### 8. Use COUNT and GROUP BY **dept.name** to show each department and the number of staff.

### Use a RIGHT JOIN to ensure that the Engineering department is listed.

```sql
SELECT dept.name ,COUNT(teacher.name)
FROM teacher
RIGHT OUTER JOIN dept
ON teacher.dept = dept.id
GROUP BY dept.name;
```

### 9.  Use CASE to show the **name** of each teacher followed by 'Sci' if the teacher is in **dept** 1 or 2 and 'Art' otherwise. Submit SQLrestore default

```sql
SELECT teacher.name, 
  CASE
       WHEN teacher.dept IN (1, 2)
       THEN 'Sci'
       ELSE 'Art'
       END
FROM teacher;
```

### 10. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise.

```sql
SELECT teacher.name, 
  CASE
       WHEN teacher.dept IN (1, 2)
       THEN 'Sci'
       WHEN teacher.dept IN (3)
       THEN 'Art'
       ELSE 'None'
       END
FROM teacher;
```