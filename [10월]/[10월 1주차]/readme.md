# 10월 1주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

`문제 플랫폼`    
 SQLZOO

---

## More JOIN operations

### 1. 1962 movies

```sql
SELECT id, title
 FROM movie
 WHERE yr=1962
```

### 2. **When was Citizen Kane released?**

```sql
SELECT yr
 FROM movie
 WHERE title = 'Citizen Kane'
```

### 3. **Star Trek movies**

```sql
SELECT id, title, yr
 FROM movie
 WHERE title Like 'Star Trek%'
 ORDER BY yr
```

### 4. **id for actor Glenn Close**

```sql
SELECT DISTINCT actor.id
  FROM casting INNER JOIN movie ON movie.id = casting.movieid
               INNER JOIN actor ON casting.actorid = actor.id
 WHERE actor.name = 'Glenn Close'
```

### 5. **id for Casablanca**

```sql
SELECT id
  FROM movie
 WHERE title = 'Casablanca'
```

### 6. **Cast list for Casablanca**

```sql
SELECT actor.name
  FROM casting INNER JOIN movie ON movie.id = casting.movieid
               INNER JOIN actor ON casting.actorid = actor.id
 WHERE casting.movieid = 11768
```

### 7. Alien Cast List

```sql
SELECT actor.name
  FROM casting INNER JOIN movie ON movie.id = casting.movieid
               INNER JOIN actor ON casting.actorid = actor.id
 WHERE movie.title = 'Alien'
```

### 8. **Harrison Ford movies**

```sql
SELECT movie.title
  FROM casting INNER JOIN movie ON movie.id = casting.movieid
               INNER JOIN actor ON casting.actorid = actor.id
 WHERE actor.name = 'Harrison Ford'
```

### 9. **Harrison Ford as a supporting actor**

```sql
SELECT movie.title
  FROM casting INNER JOIN movie ON movie.id = casting.movieid
               INNER JOIN actor ON casting.actorid = actor.id
 WHERE actor.name = 'Harrison Ford' AND casting.ord != 1
```

### 10. **Lead actors in 1962 movies**

```sql
SELECT movie.title, actor.name
  FROM casting INNER JOIN movie ON movie.id = casting.movieid
               INNER JOIN actor ON casting.actorid = actor.id
 WHERE movie.yr = 1962 AND casting.ord = 1
```

### 11. **Busy years for Rock Hudson**

```sql
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2
```

### 12. **Lead actor in Julie Andrews movies**

```sql
SELECT movie.title, actor.name
FROM casting INNER JOIN movie ON movie.id = casting.movieid
             INNER JOIN actor ON casting.actorid = actor.id
WHERE movieid IN (
  SELECT movie.id
  FROM casting INNER JOIN movie ON movie.id = casting.movieid
               INNER JOIN actor ON casting.actorid = actor.id
 WHERE actor.name='Julie Andrews')
AND casting.ord = 1
```

### 13. **Actors with 15 leading roles**

```sql
SELECT actor.name
  FROM casting INNER JOIN movie ON movie.id = casting.movieid
               INNER JOIN actor ON casting.actorid = actor.id
WHERE casting.ord = 1
GROUP BY actor.name
HAVING count(actor.name) >= 15
```

### 14. **released in the year 1978**

```sql
SELECT movie.title, count(actorid)
  FROM casting INNER JOIN movie ON movie.id = casting.movieid
               INNER JOIN actor ON casting.actorid = actor.id
WHERE movie.yr = 1978
GROUP BY movie.title
ORDER BY count(actorid) DESC, title
```

### 15. **with 'Art Garfunkel'**

```sql
SELECT actor.name
  FROM casting INNER JOIN movie ON movie.id = casting.movieid
               INNER JOIN actor ON casting.actorid = actor.id
WHERE movieid IN (
  SELECT movie.id
  FROM casting INNER JOIN movie ON movie.id = casting.movieid
               INNER JOIN actor ON casting.actorid = actor.id
 WHERE actor.name='Art Garfunkel')
```