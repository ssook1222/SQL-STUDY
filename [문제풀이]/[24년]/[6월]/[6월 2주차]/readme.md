# 6월 2주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** Leetcode

### **1731. The Number of Employees Which Report to Each Employee**

```sql
SELECT      A.EMPLOYEE_ID
            , A.NAME
            , COUNT(B.EMPLOYEE_ID) AS REPORTS_COUNT
            , ROUND(AVG(B.AGE)) AS AVERAGE_AGE
FROM        EMPLOYEES A 
            INNER JOIN EMPLOYEES B ON A.EMPLOYEE_ID = B.REPORTS_TO
GROUP BY    A.EMPLOYEE_ID, A.NAME
HAVING      COUNT(B.EMPLOYEE_ID) >= 1
ORDER BY    A.EMPLOYEE_ID;
```

### 1251. Average Selling Price

```sql
SELECT P.PRODUCT_ID,
       CASE
           WHEN SUM(U.UNITS) IS NULL THEN 0 
           ELSE ROUND(SUM(P.PRICE * U.UNITS) / SUM(U.UNITS), 2)
       END AS AVERAGE_PRICE
FROM PRICES P
LEFT OUTER JOIN UNITSSOLD U
ON P.PRODUCT_ID = U.PRODUCT_ID
AND U.PURCHASE_DATE BETWEEN P.START_DATE AND P.END_DATE
GROUP BY P.PRODUCT_ID;

```

### **1141. User Activity for the Past 30 Days I**

```sql
SELECT ACTIVITY_DATE AS DAY,
       COUNT(DISTINCT USER_ID) AS ACTIVE_USERS
FROM ACTIVITY
WHERE ACTIVITY_DATE BETWEEN '2019-06-28' AND '2019-07-27'  
GROUP BY ACTIVITY_DATE
HAVING ACTIVE_USERS > 0
```