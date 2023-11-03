# 11월 1주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

`문제 플랫폼`    
 LeetCode

### 1393. Capital Gain/Loss

```sql
WITH BuySell AS (
    SELECT
        stock_name,
        SUM(CASE WHEN operation = 'Buy' THEN -price ELSE price END) AS capital_change
    FROM Stocks
    GROUP BY stock_name, operation_day
)

SELECT
    stock_name,
    SUM(capital_change) AS capital_gain_loss
FROM BuySell
GROUP BY stock_name;
```

### 1661. Average Time of Process per Machine

```sql
WITH FIRST AS (
  SELECT  MACHINE_ID
          , SUM(CASE WHEN ACTIVITY_TYPE = 'end' THEN timestamp ELSE -timestamp END) AS PROCESSING_TIME  
  FROM Activity 
  GROUP BY MACHINE_ID, PROCESS_ID
)

SELECT   MACHINE_ID
         ,  ROUND(AVG(PROCESSING_TIME), 3) AS processing_time
FROM    FIRST
GROUP BY  MACHINE_ID
```

### 619. Biggest Single Number

```sql
WITH RAW AS (
  SELECT    NUM
  FROM      MYNUMBERS
  GROUP BY  NUM
  HAVING    COUNT(*) < 2
)

SELECT  MAX(NUM) AS NUM
FROM    RAW
```