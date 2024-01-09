# 1월 2주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** SQLBolt

---

### List all movies and their combined sales in **millions** of dollars

```sql
SELECT  m.title
        , (b.domestic_sales + b.international_sales) / 1000000 as sales
FROM movies m INNER JOIN boxoffice b 
ON m.id = b.movie_id;
```

### List all movies and their ratings **in percent**

```sql
SELECT  m.title
        , b.rating * 10 as rating
FROM movies m INNER JOIN boxoffice b 
ON m.id = b.movie_id;
```

### List all movies that were released on even number years

```sql
SELECT  m.title
FROM movies m
WHERE m.year % 2 = 0;
```