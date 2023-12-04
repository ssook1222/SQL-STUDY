# 6월 2주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

`문제 플랫폼`    
HackerRank

## **Employee Salaries**

```sql
SELECT      name
FROM        employee
WHERE       salary > 2000 and months < 10;
```

## **Type of Triangle**

```sql
SELECT
    CASE
        WHEN ((A + B > C) AND (B + C > A) AND (A + C > B)) AND A = B AND B = C THEN 'Equilateral'
        WHEN ((A + B > C) AND (B + C > A) AND (A + C > B)) AND A = B OR B = C OR A = C THEN 'Isosceles'
        WHEN ((A + B > C) AND (B + C > A) AND (A + C > B)) AND A <> B AND B <> C AND A <> C THEN 'Scalene'
        ELSE 'Not A Triangle'
    END AS TriangleType
FROM
    TRIANGLES;
```

## **Revising Aggregations - The Count Function**

```sql
SELECT      count(*)
FROM        city
WHERE       population > 100000
```

---

### 6월 6일

### **Revising Aggregations - The Sum Function**

```sql
SELECT      sum(population)
FROM        city
WHERE       district = 'California';
```

### **Revising Aggregations - Averages**

```sql
SELECT  avg(population)
FROM    city
where   district = 'California';
```

### **Average Population**

```sql
SELECT  round(avg(population),0)
FROM    city;
```

---

### 6월 7일
### **Japan Population**

```sql
SELECT  sum(population)
FROM    city
WHERE   countrycode = 'JPN';
```

### **Population Density Difference**

```sql
SELECT  max(population) - min(population)
FROM    city;
```

### **The Blunder**

```sql
SELECT  round(avg(salary),0) - round(avg(replace(salary, '0', '')),0)
FROM    employees;
```

---

### 6월 8일

### **Top Earners**

```sql
SELECT  salary_months
        , COUNT(*)
FROM (
      SELECT salary * months AS salary_months
      FROM employee
     ) AS subquery
WHERE salary_months = (
      SELECT MAX(salary * months)
      FROM employee
)
GROUP BY salary_months;
```

### **Population Census**

```sql
SELECT      sum(ct.population)
FROM        COUNTRY cnt INNER JOIN CITY ct ON cnt.code = ct.countrycode
WHERE       cnt.continent = 'ASIA';
```

### **Average Population of Each Continent**

```sql
SELECT      cnt.continent
            , floor(avg(ct.population))
FROM        country cnt 
INNER JOIN city ct on ct.countrycode = cnt.code
GROUP BY    cnt.continent
;
```

---

### 6월 9일

### **Weather Observation Station 2**

```sql
SELECT  ROUND(SUM(LAT_N),2),
        ROUND(SUM(LONG_W),2)
FROM    STATION;
```

### **Weather Observation Station 13**

```sql
SELECT      TRUNC(SUM(LAT_N), 4)
FROM        STATION
WHERE       LAT_N >= 38.7880 AND LAT_N <= 137.2345;
```

### **Weather Observation Station 14**

```sql
SELECT  TRUNC(MAX(LAT_N),4)
FROM    STATION
WHERE   LAT_N < 137.2345;
```

