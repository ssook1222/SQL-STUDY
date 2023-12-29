# 12월 4주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** SQLBolt

---
### Find the number of movies each director has directed

```sql
SELECT  DIRECTOR, 
        COUNT(TITLE) AS NUM
FROM    MOVIES
GROUP BY DIRECTOR;
```

### Find the total domestic and international sales that can be attributed to each director

```sql
SELECT  DIRECTOR, SUM ((DOMESTIC_SALES + INTERNATIONAL_SALES)) AS RES
FROM    MOVIES A INNER JOIN BOXOFFICE B ON A.ID = B.MOVIE_ID
GROUP BY DIRECTOR;
```

### Show the sales numbers for each movie that did better internationally rather than domestically

```sql
SELECT  TITLE, 
        DOMESTIC_SALES, 
        INTERNATIONAL_SALES
FROM    MOVIES A INNER JOIN BOXOFFICE B ON A.ID = B.MOVIE_ID
```