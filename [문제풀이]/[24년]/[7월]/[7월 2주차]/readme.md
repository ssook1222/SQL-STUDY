# 7월 2주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** Leetcode

### **626. Exchange Seats**

```sql
SELECT 
    CASE 
        WHEN MOD(id, 2) = 1 THEN 
            CASE 
                WHEN id + 1 > (SELECT MAX(id) FROM Seat) THEN id 
                ELSE id + 1 
            END 
        ELSE id - 1 
    END AS id, 
    student
FROM Seat
ORDER BY id ASC;
```

### **1341. Movie Rating**

```sql
(SELECT name AS results
 FROM (
     SELECT U.name, COUNT(*) AS count
     FROM MovieRating MR
     JOIN Users U ON MR.user_id = U.user_id
     GROUP BY U.user_id
     ORDER BY count DESC, U.name
     LIMIT 1
 ) AS T1)

UNION ALL

(SELECT title AS results
 FROM (
     SELECT M.title, AVG(MR.rating) AS avg_rating
     FROM MovieRating MR
     JOIN Movies M ON MR.movie_id = M.movie_id
     WHERE MR.created_at BETWEEN '2020-02-01' AND '2020-02-29'
     GROUP BY M.movie_id
     ORDER BY avg_rating DESC, M.title
     LIMIT 1
 ) AS T2);

```

### 1321. Restaurant Growth

```sql
WITH C_SUM AS (
    SELECT visited_on,
           SUM(amount) AS SUM_AMOUNT
    FROM customer
    GROUP BY visited_on
),
C_ALL AS (
    SELECT visited_on,
           SUM(SUM_AMOUNT) OVER w AS AMOUNT,
           ROUND(SUM(SUM_AMOUNT) OVER w / 7, 2) AS AVERAGE_AMOUNT
    FROM CSUM
    WINDOW w AS (ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW)          
)
SELECT visited_on, AMOUNT, AVERAGE_AMOUNT
FROM C_ALL
WHERE visited_on >= (SELECT DATE_ADD(MIN(visited_on), INTERVAL 6 DAY)
                     FROM customer)
ORDER BY visited_on;

```