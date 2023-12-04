# 8월 3주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

`문제 플랫폼`    
SQL Zoo

---

## 8월 18일

## **SELECT from WORLD Tutorial**

### **Introduction**

```sql
SELECT name, continent, population 
FROM world
```

### **Large Countries**

```sql
SELECT name 
FROM world
WHERE population > 200000000
```

### **Per capita GDP**

```sql
SELECT NAME, GDP / POPULATION
FROM WORLD
WHERE POPULATION > 200000000
```

### **South America In millions**

```sql
SELECT NAME, POPULATION / 1000000
FROM WORLD
WHERE CONTINENT = 'South America'
```

### **France, Germany, Italy**

```sql
SELECT NAME, POPULATION
FROM WORLD
WHERE NAME = 'France' OR NAME = 'Germany' OR NAME = 'Italy'
```

### **United**

```sql
SELECT NAME
FROM WORLD
WHERE NAME LIKE '%United%'
```

### **Two ways to be big**

```sql
SELECT NAME, POPULATION, AREA
FROM WORLD
WHERE AREA > 3000000 OR POPULATION > 250000000
```

### **One or the other (but not both)**

```sql
SELECT NAME, POPULATION, AREA
FROM WORLD
WHERE (AREA < 3000000 AND POPULATION > 250000000) OR (AREA > 3000000 AND POPULATION < 250000000)
```

### **Rounding**

```sql
SELECT NAME
, ROUND(POPULATION/1000000, 2)
, ROUND(GDP/1000000000, 2)
FROM WORLD
WHERE CONTINENT = 'South America'
```

### **Trillion dollar economies**

```sql
SELECT NAME, ROUND(GDP / POPULATION, -3)
FROM WORLD
WHERE GDP > 1000000000000
```

### **Name and capital have the same length**

```sql
SELECT name, capital
  FROM world
 WHERE length(name) = length(capital)
```

### **Matching name and capital**

```sql
SELECT name, capital
FROM world
WHERE (LEFT(name,1) = LEFT(capital,1)) AND name != capital
```

### **All the vowels**

```sql
SELECT name
   FROM world
WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%'
  AND name LIKE '%o%' AND name LIKE '%u%'
  AND name NOT LIKE '% %'
```

---

## **BBC QUIZ**

### 1. Select the code which gives the name of countries beginning with U

```sql
SELECT name
  FROM world
 WHERE name LIKE 'U%'
```

### 2. Select the code which shows just the population of United Kingdom?

```sql
SELECT population
  FROM world
 WHERE name = 'United Kingdom'
```

### 3. Select the answer which shows the problem with this SQL code - the intended result should be the continent of France:

'name' should be name

### 4. Select the result that would be obtained from the following code:

| Nauru | 990 |
| --- | --- |

### 5. Select the code which would reveal the name and population of countries in Europe and Asia

```sql
SELECT name, population
  FROM world
 WHERE continent IN ('Europe', 'Asia')
```

### 6. Select the code which would give two rows

```sql
SELECT name FROM world
 WHERE name IN ('Cuba', 'Togo')
```

### 7. Select the result that would be obtained from this code

| Brazil |
| --- |
| Colombia |