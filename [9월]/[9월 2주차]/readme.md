# 9월 2주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

`문제 플랫폼`    
SQL Zoo

## 9월 9일

## **SELECT within SELECT Tutorial**

### **Bigger than Russia**

```sql
SELECT name 
FROM world
WHERE population >
     ( SELECT population 
         FROM world
        WHERE name='Russia')
```

### **Richer than UK**

```sql
SELECT name 
FROM world
  WHERE gdp / population >
     ( SELECT gdp / population 
				FROM world
       WHERE name='United Kingdom') 
and continent = 'Europe'
```

### **Neighbours of Argentina and Australia**

```sql
SELECT name, continent
FROM world
  WHERE continent in
     ( SELECT continent
				FROM world
       WHERE name='Argentina' or name = 'Australia') 
ORDER BY name
```

### **Between Canada and Poland**

```sql
SELECT name, population 
FROM world
WHERE population >
     ( SELECT population 
         FROM world
        WHERE name='United Kingdom') 
and population <
     ( SELECT population 
         FROM world
        WHERE name='Germany')
```

### **Percentages of Germany**

```sql
SELECT name
			 , CONCAT(ROUND((population*100)/
				(SELECT population 
           FROM world 
				  WHERE name='Germany'), 0), '%')
FROM world
WHERE population IN (SELECT population
                     FROM world
                     WHERE continent='Europe')
```

### Bigger than every country in Europe

```sql
SELECT name 
FROM world 
WHERE gdp > ALL(SELECT gdp 
                  FROM world 
                 WHERE gdp > 0 AND continent = 'Europe')
```

### **Largest in each continent**

```sql
SELECT continent, 
						name, 
						area 
FROM world x
WHERE area >= ALL (SELECT area 
										FROM world y
						        WHERE y.continent=x.continent AND area>0)
```

### **First country of each continent (alphabetically)**

```sql
SELECT continent
      , name
FROM world x
WHERE name <= ALL(
	SELECT name
	FROM world y
	WHERE y.continent = x.continent
);
```

### **Difficult Questions That Utilize Techniques Not Covered In Prior Sections**

```sql
SELECT name, continent, population 
FROM world 
WHERE continent IN (
      SELECT continent 
        FROM world  x 
       WHERE 25000000 >= 
             (SELECT MAX(population) 
                FROM world y 
               WHERE x.continent = y.continent))
```

### **Three time bigger**

```sql
SELECT name
			 , continent 
FROM world x
WHERE population > ALL (
			SELECT 3*population 
			  FROM world y 
			 WHERE x.continent = y.continent AND x.name <> y.name
)
```

---

### **Nested SELECT Quiz**

1. Select the code that shows the name, region and population of the smallest country in each region.

```sql
SELECT region, name, population 
FROM bbc x 
WHERE population <= ALL (
	SELECT population 
		FROM bbc y 
		WHERE y.region=x.region AND population>0
)
```

2. Select the code that shows the countries belonging to regions with all populations over 50000.

```sql
SELECT name,region,population 
FROM bbc x 
WHERE 50000 < ALL 
	(
		SELECT population 
		FROM bbc y 
		WHERE x.region=y.region AND y.population>0
	)
```

3. Select the code that shows the countries with a less than a third of the population of the countries around it

```sql
SELECT name, region 
FROM bbc x
 WHERE population < ALL (
		SELECT population/3 
			FROM bbc y 
			WHERE y.region = x.region AND y.name != x.name
)
```

4. Select the result that would be obtained from the following code:

```sql
SELECT name FROM bbc
 WHERE population >
       (SELECT population
          FROM bbc
         WHERE name='United Kingdom')
   AND region IN(SELECT region
          FROM bbc
         WHERE name = 'United Kingdom')
```

| France |
| --- |
| Germany |
| Russia |
| Turkey |

5. Select the code that would show the countries with a greater GDP than any country in Africa (some countries may have NULL gdp values).

```sql
SELECT name FROM bbc
 WHERE gdp > (SELECT MAX(gdp) FROM bbc WHERE region = 'Africa')
```

6. Select the code that shows the countries with population smaller than Russia but bigger than Denmark

```sql
SELECT name FROM bbc
 WHERE population < (SELECT population FROM bbc WHERE name='Russia')
   AND population > (SELECT population FROM bbc WHERE name='Denmark')
```

7.  Select the result that would be obtained from the following code.

```sql
SELECT name FROM bbc
 WHERE population > ALL
       (SELECT MAX(population)
          FROM bbc
         WHERE region = 'Europe')
   AND region = 'South Asia'
```

| Bangladesh |
| --- |
| India |
| Pakistan |
