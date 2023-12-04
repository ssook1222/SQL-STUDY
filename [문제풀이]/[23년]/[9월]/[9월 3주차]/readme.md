# 9월 3주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

`문제 플랫폼`    
SQL Zoo

## 9월 15일

## SUM and COUNT

### Total world population

```sql
SELECT SUM(population)
FROM world
```

### **List of continents**

```sql
SELECT DISTINCT continent
FROM world
```

### GDP of Africa

```sql
SELECT SUM(GDP)
FROM world
WHERE continent = 'Africa'
```

### Count the big countries

```sql
SELECT count(*)
FROM world
WHERE area > 1000000
```

### Baltic states population

```sql
SELECT sum(population)
FROM world
WHERE name in ('Estonia', 'Latvia', 'Lithuania')
```

### **Counting the countries of each continent**

```sql
SELECT continent, count(name)
FROM world
GROUP BY continent
```

### Counting big countries in each continent

```sql
SELECT continent, count(name)
FROM world
WHERE population > 10000000
GROUP BY continent
```

### Counting big continents

```sql
SELECT continent
FROM world
GROUP BY continent
HAVING sum(population) > 100000000
```

---

## SUM and Count Quiz

### 1. Select the statement that shows the sum of population of all countries in 'Europe’

```sql
SELECT SUM(population) FROM bbc WHERE region = 'Europe'
```

### 2. Select the statement that shows the number of countries with population smaller than 150000

```sql
SELECT COUNT(name) FROM bbc WHERE population < 150000
```

### 3. Select the list of core SQL aggregate functions

AVG(), COUNT(), MAX(), MIN(), SUM()

### 4. Select the result that would be obtained from the following code:

```sql
SELECT region,
		   SUM(area)
FROM bbc
WHERE SUM(area) > 15000000
GROUP BY region
```

No result due to invalid use of the WHERE function.

### 5. Select the statement that shows the average population of 'Poland', 'Germany' and 'Denmark’

```sql
SELECT AVG(population) 
FROM bbc 
WHERE name IN ('Poland', 'Germany', 'Denmark')
```

### 6. Select the statement that shows the medium population density of each region

```sql
SELECT region, SUM(population)/SUM(area) AS density 
FROM bbc 
GROUP BY region
```

### 7. Select the statement that shows the name and population density of the country with the largest population

```sql
SELECT name, population/area AS density 
FROM bbc 
WHERE population = (
											SELECT MAX(population) 
												FROM bbc
									 )
```

### 8. Pick the result that would be obtained from the following code:

```sql
SELECT region, SUM(area) 
   FROM bbc 
  GROUP BY region 
  HAVING SUM(area)<= 20000000
```

| Americas | 732240 |
| --- | --- |
| Middle East | 13403102 |
| South America | 17740392 |
| South Asia | 943771 |
