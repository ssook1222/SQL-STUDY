# 1월 3주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`날짜`**  1월 15일, 1월 19일
**`문제플랫폼`** SQLBolt

---
## Exercise1 - ****SELECT queries 101****

### Find the **`title`** of each film

```sql
SELECT TITLE 
FROM movies;
```

### Find the **`director`** of each film

```sql
SELECT Director
FROM movies;
```

### Find the **`title`** and **`director`** of each film

```sql
SELECT Director, Title
FROM movies;
```

### Find the **`title`** and **`year`** of each film

```sql
SELECT Title, year
FROM movies;
```

### Find **`all`** the information about each film

```sql
SELECT *
FROM movies;
```

---
## ****SQL Lesson 2: Queries with constraints (Pt. 1)****

### Find the movie with a row **`id`** of 6

```sql
SELECT * 
FROM movies
WHERE id = 6;
```

### Find the movies released in the **`year`** between 2000 and 2010

```sql
SELECT *
FROM movies
WHERE YEAR BETWEEN 2000 AND 2010;
```

### Find the movies **not** released in the **`year`**s between 2000 and 2010

```sql
SELECT *
FROM movies
WHERE NOT YEAR BETWEEN 2000 AND 2010;
```

### Find the first 5 Pixar movies and their release **`year`**

```sql
SELECT *
FROM movies
LIMIT 5;
```