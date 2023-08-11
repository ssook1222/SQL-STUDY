# 8월 2주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

`문제 플랫폼`    
SQL Zoo

## 8월 11일

## SELECT name

### **Find the country that start with Y**

```sql
SELECT name 
FROM world
WHERE name LIKE 'Y%'
```

### **Find the countries that end with y**

```sql
SELECT name 
FROM world
WHERE name LIKE '%y'
```

### **Find the countries that contain the letter x**

```sql
SELECT name 
FROM world
WHERE name LIKE '%x%'
```

### **Find the countries that end with land**

```sql
SELECT name 
FROM world
WHERE name LIKE '%land'
```

### **Find the countries that start with C and end with ia**

```sql
SELECT name 
FROM world
WHERE name LIKE 'C%' and name LIKE '%ia'
```

### **Find the country that has oo in the name**

```sql
SELECT name 
FROM world
WHERE name LIKE '%oo%'
```

### **Find the countries that have three or more a in the name**

```sql
SELECT name 
FROM world
WHERE name LIKE '%a%a%a%'
```

### **Find the countries that have "t" as the second character.**

```sql
SELECT name FROM world
WHERE name LIKE '_t%'
ORDER BY name
```

### **Find the countries that have two "o" characters separated by two others**

```sql
SELECT name 
FROM world
WHERE name LIKE '%o__o%'
```

### **Find the countries that have exactly four characters.**

```sql
SELECT name 
FROM world
WHERE name LIKE '____'
```

### **Find the country where the name is the capital city.**

```sql
SELECT name
FROM world
WHERE name = capital
```

### **Find the country where the capital is the country plus "City".**

```sql
SELECT name
FROM world
WHERE capital = concat(name, ' City')
```

### **Find the capital and the name where the capital includes the name of the country.**

```sql
SELECT capital, name
FROM world
WHERE capital like concat('%', name, '%')
```

### **Find the capital and the name where the capital is an extension of name of the country.**

```sql
SELECT capital, name
FROM world
WHERE capital like concat('%', name, '%') and capital > name
```

### **Show the name and the extension where the capital is an extension of name of the country.**
```sql
SELECT name, REPLACE(capital, name, '')
FROM world
WHERE capital LIKE concat('%', name, '%')
```