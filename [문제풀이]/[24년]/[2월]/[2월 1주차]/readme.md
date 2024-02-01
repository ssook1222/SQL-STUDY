# 2월 1주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** sqlbolt

---

## **SQL Review: Simple SELECT Queries**

### List all the Canadian cities and their populations

```sql
SELECT * 
FROM north_american_cities
WHERE Country = 'Canada';
```

### Order all the cities in the United States by their latitude from north to south

```sql
SELECT *
FROM NORTH_AMERICAN_CITIES
WHERE COUNTRY = 'United States'
ORDER BY LATITUDE DESC;
```

### List all the cities west of Chicago, ordered from west to east

```sql
SELECT *
FROM NORTH_AMERICAN_CITIES
WHERE LONGITUDE < -87.629798
ORDER BY LONGITUDE ASC;
```

### List the two largest cities in Mexico (by population)

```sql
SELECT *
FROM NORTH_AMERICAN_CITIES
WHERE COUNTRY = 'Mexico'
ORDER BY POPULATION DESC
LIMIT 2;
```

### List the third and fourth largest cities (by population) in the United States and their population

```sql
SELECT *
FROM NORTH_AMERICAN_CITIES
WHERE COUNTRY = 'United States'
ORDER BY POPULATION DESC
LIMIT 2 OFFSET 2;
```