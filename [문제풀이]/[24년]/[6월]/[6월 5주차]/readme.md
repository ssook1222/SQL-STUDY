# 6월 4주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** Leetcode

### 570. Managers with at Least 5 Direct Reports

```sql
SELECT NAME
FROM EMPLOYEE
WHERE ID IN (
    SELECT MANAGERID
    FROM EMPLOYEE
    WHERE MANAGERID IS NOT NULL
    GROUP BY MANAGERID
    HAVING COUNT(*) >= 5
);
```

### 1934. Confirmation Rate

```sql
SELECT 
    S.USER_ID,
    IFNULL(ROUND(COUNT(CASE WHEN C.ACTION = 'CONFIRMED' THEN 1 END) / COUNT(C.ACTION), 2), 0) AS CONFIRMATION_RATE
FROM 
    SIGNUPS S
LEFT JOIN 
    CONFIRMATIONS C ON S.USER_ID = C.USER_ID
GROUP BY 
    S.USER_ID;

```

### 1193. Monthly Transactions I

```sql
SELECT 
    DATE_FORMAT(TRANS_DATE, '%Y-%m') AS month,
    country,
    COUNT(ID) AS trans_count,
    COUNT(CASE WHEN STATE = 'APPROVED' THEN ID END) AS approved_count,
    IFNULL(SUM(AMOUNT), 0) AS trans_total_amount,
    IFNULL(SUM(CASE WHEN STATE = 'APPROVED' THEN AMOUNT END), 0) AS approved_total_amount
FROM 
    TRANSACTIONS
GROUP BY 
    DATE_FORMAT(TRANS_DATE, '%Y-%m'), COUNTRY;

```