# 1월 4주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`날짜`**  1월 25일
**`문제플랫폼`** SQLBolt

---
**`문제플랫폼`** sqlbolt

---

## Exercise 3

### Find all the Toy Story movies

```sql
SELECT * 
FROM movies
WHERE Title LIKE 'Toy Story%';
```

### Find all the movies directed by John Lasseter

```sql
SELECT * 
FROM movies
WHERE Director = 'John Lasseter';
```

### Find all the movies (and director) not directed by John Lasseter

```sql
SELECT  title
        , director
FROM movies
WHERE NOT Director = 'John Lasseter';
```

### Find all the WALL-* movies

```sql
SELECT  *
FROM movies
WHERE title LIKE 'WALL-%';
```