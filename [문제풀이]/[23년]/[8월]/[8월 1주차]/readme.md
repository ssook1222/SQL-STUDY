# 8월 1주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

`문제 플랫폼`    
SQL Zoo

## 8월 2일

## SELECT basics

### **Introducing the `world` table of countries**

```sql
SELECT population 
FROM world
WHERE name = 'France'
```

### **Scandinavia**

```sql
SELECT name, population 
FROM world
WHERE name IN ( 'Sweden', 'Norway','Denmark');
```

### Just the Right Size

```sql
SELECT name, area 
FROM world
WHERE area BETWEEN 200000 AND 250000
```

---

### SELECT QUIZ

Some questions concerning basic SQL statements

| name | region | area | population | gdp |
| --- | --- | --- | --- | --- |
| Afghanistan | South Asia | 652225 | 26000000 |  |
| Albania | Europe | 28728 | 3200000 | 6656000000 |
| Algeria | Middle East | 2400000 | 32900000 | 75012000000 |
| Andorra | Europe | 468 | 64000 |  |
| ... |  |  |  |  |

1. Select the code which produces this table

| name | population |
| --- | --- |
| Bahrain | 1234571 |
| Swaziland | 1220000 |
| Timor-Leste | 1066409 |

```sql
SELECT name, population
FROM world
WHERE population BETWEEN 1000000 AND 1250000
```

2. Pick the result you would obtain from this code:

```sql
SELECT name, population
FROM world
WHERE name LIKE "Al%"
```

| Albania | 3200000 |
| --- | --- |
| Algeria | 32900000 |

3. Select the code which shows the countries that end in A or L

```sql
SELECT name 
FROM world
WHERE name LIKE '%a'OR name LIKE '%l'
```

4. Pick the result from the query

```sql
SELECT name,length(name)
FROM world
WHERE length(name)=5 and region='Europe'
```

| name | length(name) |
| --- | --- |
| Italy | 5 |
| Malta | 5 |
| Spain | 5 |

5. Here are the first few rows of the world table:

| name | region | area | population | gdp |
| --- | --- | --- | --- | --- |
| Afghanistan | South Asia | 652225 | 26000000 |  |
| Albania | Europe | 28728 | 3200000 | 6656000000 |
| Algeria | Middle East | 2400000 | 32900000 | 75012000000 |
| Andorra | Europe | 468 | 64000 |  |
| ... |  |  |  |  |

Pick the result you would obtain from this code:

```sql
SELECT name, area*2 
FROM world 
WHERE population = 64000
```

| Andorra | 936 |
| --- | --- |

6. Select the code that would show the countries with an area larger than 50000 and a population smaller than 10000000

```sql
SELECT name, area, population
  FROM world
 WHERE area > 50000 AND population < 10000000
```

7. Select the code that shows the population density of China, Australia, Nigeria and France
```sql
SELECT name, population/area
  FROM world
 WHERE name IN ('China', 'Nigeria', 'France', 'Australia')
```

