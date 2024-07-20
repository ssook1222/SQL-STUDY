# 7월 3주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** Leetcode

### **1204. Last Person to Fit in the Bus**

```sql
WITH A AS (
    SELECT PERSON_NAME, SUM(WEIGHT) OVER(ORDER BY TURN) AS WEIGHT_SUM 
    FROM  QUEUE
)
SELECT 
    LAST_VALUE(PERSON_NAME) OVER(ORDER BY WEIGHT_SUM DESC) AS person_name  
FROM A
WHERE A.WEIGHT_SUM<=1000
LIMIT 1
```

### **1907. Count Salary Categories**

```sql
WITH S AS 
(
        SELECT 'Low Salary' AS category
        UNION
        SELECT 'Average Salary'
        UNION
        SELECT 'High Salary'
),
T AS (
    SELECT CASE
                WHEN income < 20000 THEN "Low Salary"
                WHEN income > 50000 THEN 'High Salary'
                ELSE 'Average Salary'
            END AS category,
            COUNT(1) AS accounts_count
    FROM Accounts
    GROUP BY 1
)

SELECT category, IFNULL(accounts_count, 0) AS accounts_count
FROM S LEFT JOIN T USING (category);
```

### **602. Friend Requests II: Who Has the Most Friends**

```sql
with raw as (
    select requester_id as id1, accepter_id as id2 from RequestAccepted
    union all
    select accepter_id as id1, requester_id as id2  from RequestAccepted
)
select id1 as id, count(id2) as num
from raw
group by id1 
order by num desc limit 1
```