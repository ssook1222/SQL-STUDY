# 9월 1주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

`문제 플랫폼`    
SQL Zoo

## 9월 1일

## **SELECT from Nobel Tutorial**

### **Winners from 1950**

```sql
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950
```

### **1962 Literature**

```sql
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'literature'
```

### **Albert Einstein**

```sql
SELECT yr, subject
  FROM nobel
 WHERE winner = 'Albert Einstein'
```

### **Recent Peace Prizes**

```sql
SELECT winner
  FROM nobel
 WHERE yr >= 2000
   AND subject = 'peace'
```

### **Literature in the 1980's**

```sql
SELECT yr, subject, winner
  FROM nobel
 WHERE yr BETWEEN 1980 AND 1989
   AND subject = 'Literature'
```

### **Only Presidents**

```sql
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama')
```

### John

```sql
SELECT winner
  FROM nobel
 WHERE winner like 'John%'
```

### Chemistry and Physics from different years

```sql
SELECT yr, subject, winner
  FROM nobel
 WHERE (subject = 'Physics' and yr=1980) or (subject = 'Chemistry' and yr=1984)
```

### **Exclude Chemists and Medics**

```sql
SELECT yr, subject, winner
  FROM nobel
WHERE  subject != 'Chemistry' and subject != 'Medicine'
  AND  yr = 1980
```

### **Early Medicine, Late Literature**

```sql
SELECT yr, subject, winner
  FROM nobel
 WHERE (yr < 1910 and subject = 'Medicine') or (yr > 2003 and subject = 'Literature')
```

### **Harder Questions**

```sql
SELECT *
  FROM nobel
 WHERE winner = 'PETER GRÜNBERG'
```

### **Apostrophe**

```sql
SELECT *
  FROM nobel
 WHERE winner like 'Eugene O%'
```

### Knights of the realm

```sql
SELECT winner, yr, subject
  FROM nobel
 WHERE winner like 'Sir%'
 ORDER BY yr DESC, winner
```

### **Chemistry and Physics last**

```sql
SELECT winner, subject
  FROM nobel
 WHERE yr = 1984
**ORDER BY
    CASE**
        WHEN subject IN ('Physics', 'Chemistry') THEN 1
        ELSE 0
    END
    , subject
    , winner
```
