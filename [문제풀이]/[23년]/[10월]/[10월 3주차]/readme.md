# 10월 3주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

`문제 플랫폼`    
 SQLZOO

## Numeric Example

### 1. **Check out one row**

```sql
SELECT A_STRONGLY_AGREE
  FROM nss
 WHERE question='Q01'
   AND institution='Edinburgh Napier University'
   AND subject='(8) Computer Science'
```

### 2. **Calculate how many agree or strongly agree**

```sql
SELECT institution, subject
  FROM nss
 WHERE question='Q15' AND score >= 100
```

### 3. **Unhappy Computer Students**

```sql
SELECT institution,score
  FROM nss
 WHERE question='Q15'
   AND score < 50
   AND subject='(8) Computer Science'
```

### 4. **More Computing or Creative Students?**

```sql
SELECT subject,sum(response)
  FROM nss
 WHERE question='Q22'
   AND (subject='(8) Computer Science' OR subject='(H) Creative Arts and Design')
GROUP BY subject
```

### 5. **Strongly Agree Numbers**

```sql
SELECT subject,sum(response * A_STRONGLY_AGREE / 100)
  FROM nss
 WHERE question='Q22'
   AND (subject='(8) Computer Science' OR subject='(H) Creative Arts and Design')
GROUP BY subject
```

### 6. **Strongly Agree, Percentage**

```sql
SELECT subject, ROUND(SUM(response*A_STRONGLY_AGREE/100) / SUM(response) * 100)
  FROM nss
 WHERE question='Q22'
   AND (subject='(8) Computer Science' OR subject='(H) Creative Arts and Design')
GROUP BY subject
```

### 7. **Scores for Institutions in Manchester**

```sql
SELECT institution,ROUND(SUM(response*score/100) / SUM(response) * 100,0)
  FROM nss
 WHERE question='Q22'
   AND (institution LIKE '%Manchester%')
GROUP BY institution
ORDER BY institution
```

### 8. **Number of Computing Students in Manchester**

```sql
SELECT institution, SUM(sample), 
       (SELECT sample 
        FROM nss y
        WHERE subject='(8) Computer Science' AND 
              x.institution = y.institution AND 
              question='Q01') as comp
FROM nss x
WHERE question='Q01' AND 
      institution LIKE '%Manchester%'
GROUP BY institution
```