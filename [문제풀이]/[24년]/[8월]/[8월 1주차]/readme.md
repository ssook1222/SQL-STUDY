# 8월 1주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** Leetcode

### 608. Tree Node

```sql
SELECT
    t1.id,
    CASE
        WHEN t1.p_id IS NULL THEN 'Root'
        WHEN t1.id IN (SELECT DISTINCT p_id FROM Tree WHERE p_id IS NOT NULL) THEN 'Inner'
        ELSE 'Leaf'
    END AS type
FROM
    Tree t1;

```

### **3220. Odd and Even Transactions**

```sql
SELECT
    transaction_date,
    SUM(IF(amount % 2 = 1, amount, 0)) AS odd_sum,
    SUM(IF(amount % 2 = 0, amount, 0)) AS even_sum
FROM transactions
GROUP BY transaction_date
ORDER BY transaction_date;
```

### 607. Sales Person

```sql
SELECT name
FROM SalesPerson
WHERE sales_id NOT IN (
    SELECT DISTINCT sales_id
    FROM Orders
    WHERE com_id = (
        SELECT com_id
        FROM Company
        WHERE name = 'RED'
    )
);
```