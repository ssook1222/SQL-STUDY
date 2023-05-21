### 쪽지시험 성적 분석하기

```tsx
SELECT  avg(score)
FROM student;

SELECT  max(score)
        , min(score)
FROM student;

SELECT  *
FROM student
ORDER BY score desc
LIMIT 3;
```

### 쪽지시험 성적 분석하기 2

```tsx
SELECT count(*)
FROM student
WHERE score > 80;

SELECT name
FROM student
ORDER BY score desc
LIMIT 1;

SELECT grade
        , avg(score)
FROM student
GROUP BY grade;
```

### 학점 계산하기

```tsx
ALTER   TABLE student
        ADD score float;

UPDATE student 
SET score = (((midterm + final)*4.5)/200);

SELECT  name,
        score
FROM    student;
```

### 신체 검사표

```sql
SELECT  gender
        , avg(height)
        , avg(weight)
FROM    student
GROUP BY gender;

SELECT  weight
FROM    student
WHERE   gender = 'M'
ORDER BY height desc
LIMIT 1;

SELECT  weight
FROM    student
WHERE   gender = 'F'
ORDER BY height
LIMIT 1;
```

### 주주총회

```sql
SELECT  stock
FROM    shareholder
WHERE   name = 'Alexis' or name = 'Craig' or name = 'Fred' ;

SELECT  name
        , stock
FROM    shareholder
WHERE   agree = 0 and stock >= 100000;

SELECT  name
        , stock
FROM    shareholder
WHERE   agree = 1 and stock >= 100000;
```