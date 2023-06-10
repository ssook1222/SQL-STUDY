# 6월 1주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

`문제 플랫폼`    
HackerRank

`문제 풀이에 참여한 날짜`    
- [6월 1일](#6월-1일)

### 6월 1일

### SELECT BY ID

```sql
SELECT  *
FROM    CITY
WHERE   ID = 1661;
```

### **Japanese Cities' Attributes**

```sql
SELECT  *
FROM    CITY
WHERE   COUNTRYCODE = 'JPN';
```

### Japanese Citie’s Names

```sql
SELECT  NAME
FROM    CITY
WHERE   COUNTRYCODE = 'JPN';
```

### **Weather Observation Station 1**

```sql
SELECT  CITY,
        STATE
FROM    STATION;
```

### **Weather Observation Station 3**

```sql
SELECT  DISTINCT CITY
FROM    STATION
WHERE   MOD(ID, 2) = 0;
```

---

### 6월 2일

### **Weather Observation Station 4**

```sql
SELECT      count(city) - count (DISTINCT city)
FROM        station;
```

### **Weather Observation Station 5**

```sql
SELECT CITY, LENGTH(CITY) AS NAME_LENGTH
FROM STATION
ORDER BY NAME_LENGTH ASC, CITY ASC
LIMIT 1;

SELECT CITY, LENGTH(CITY) AS NAME_LENGTH
FROM STATION
ORDER BY NAME_LENGTH DESC, CITY ASC
LIMIT 1;
```

### **Weather Observation Station 6**

```sql
SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%' OR
      CITY LIKE 'a%' OR CITY LIKE 'e%' OR CITY LIKE 'i%' OR CITY LIKE 'o%' OR CITY LIKE 'u%';
```

### **Weather Observation Station 7**

```sql
SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE '%A' OR CITY LIKE '%E' OR CITY LIKE '%I' OR CITY LIKE '%O' OR CITY LIKE '%U' OR
      CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u';
```

### **Weather Observation Station 8**

```sql
SELECT DISTINCT CITY
FROM STATION
WHERE (CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%' OR
      CITY LIKE 'a%' OR CITY LIKE 'e%' OR CITY LIKE 'i%' OR CITY LIKE 'o%' OR CITY LIKE 'u%') AND (CITY LIKE '%A' OR CITY LIKE '%E' OR CITY LIKE '%I' OR CITY LIKE '%O' OR CITY LIKE '%U' OR
      CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u');
```

---

### 6월 3일

### **Weather Observation Station 10**

```sql
SELECT DISTINCT CITY
FROM STATION
WHERE NOT (CITY LIKE '%A' OR CITY LIKE '%E' OR CITY LIKE '%I' OR CITY LIKE '%O' OR CITY LIKE '%U' OR
      CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u');
```

### **Weather Observation Station 9**

```sql
SELECT DISTINCT CITY
FROM STATION
WHERE NOT (CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%' OR
      CITY LIKE 'a%' OR CITY LIKE 'e%' OR CITY LIKE 'i%' OR CITY LIKE 'o%' OR CITY LIKE 'u%');
```

### **Weather Observation Station 11**

```sql
SELECT DISTINCT CITY
FROM STATION
WHERE NOT ((CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%' OR
      CITY LIKE 'a%' OR CITY LIKE 'e%' OR CITY LIKE 'i%' OR CITY LIKE 'o%' OR CITY LIKE 'u%') AND (CITY LIKE '%A' OR CITY LIKE '%E' OR CITY LIKE '%I' OR CITY LIKE '%O' OR CITY LIKE '%U' OR
      CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u'));
```

---

### 6월 4일

### **Weather Observation Station 12**

```sql
SELECT DISTINCT CITY
FROM STATION
WHERE NOT ((CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%' OR
      CITY LIKE 'a%' OR CITY LIKE 'e%' OR CITY LIKE 'i%' OR CITY LIKE 'o%' OR CITY LIKE 'u%') OR (CITY LIKE '%A' OR CITY LIKE '%E' OR CITY LIKE '%I' OR CITY LIKE '%O' OR CITY LIKE '%U' OR
      CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u'));
```

### **Higher Than 75 Marks**

```sql
SELECT  name
FROM    students
WHERE   marks > 75
ORDER BY RIGHT(name, 3), id;
```

### Employee names

```sql
SELECT  name
FROM    Employee
ORDER BY name;
```
