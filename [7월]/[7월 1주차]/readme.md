# 7월 1주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

`문제 플랫폼`    
LeetCode

## 7월 7일


### **1757. Recyclable and Low Fat Products**

```sql
SELECT  PRODUCT_ID
FROM    PRODUCTS
WHERE   LOW_FATS = 'Y' AND RECYCLABLE = 'Y'

```

### **595. Big Countries**

```sql
SELECT  NAME
        , POPULATION
        , AREA
FROM    WORLD
WHERE   AREA >= 3000000 OR POPULATION >= 25000000

```

### **1484. Group Sold Products By The Date**

```sql
SELECT  sell_date
        , COUNT(DISTINCT product) AS num_sold
        , GROUP_CONCAT(Distinct product ORDER BY product) AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date

```

**처음 보는 문법**

`GROUP_CONCAT` 함수는 그룹 내의 값을 하나의 문자열로 연결해주는 함수입니다.

`DISTINCT` 키워드를 사용하여 중복된 값을 제외하고 연결된 문자열을 생성합니다.

`ORDER BY` 절을 사용하여 제품 이름을 알파벳 순서로 정렬합니다.

----------

### **584. Find Customer Referee**

```sql
SELECT      NAME
FROM        CUSTOMER
WHERE       REFEREE_ID IS NULL OR REFEREE_ID != 2

```

### **586. Customer Placing the Largest Number of Orders**

```sql
SELECT      CUSTOMER_NUMBER
FROM        ORDERS
GROUP BY    CUSTOMER_NUMBER
HAVING      COUNT(*) >= 2

```

### **1050. Actors and Directors Who Cooperated At Least Three Times**

```sql
SELECT      ACTOR_ID
            , DIRECTOR_ID

FROM        ACTORDIRECTOR
GROUP BY    ACTOR_ID
            , DIRECTOR_ID
HAVING      COUNT(*) >= 3

```

---
# 23-07-07

### **1789. Primary Department for Each Employee**

```sql
SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y'
UNION
SELECT employee_id, department_id
FROM Employee
WHERE employee_id NOT IN (
    SELECT employee_id
    FROM Employee
    WHERE primary_flag = 'Y'
)

```

### **1075. Project Employees I**

```sql
SELECT          p.project_id, ROUND(AVG(e.experience_years), 2) as average_years
FROM            project p
INNER JOIN      employee e ON p.employee_id = e.employee_id
GROUP BY        p.project_id;

```

### **1407. Top Travellers**

```sql
SELECT u.name, COALESCE(SUM(r.distance), 0) AS travelled_distance
FROM Users u
LEFT JOIN Rides r ON u.id = r.user_id
GROUP BY u.id, u.name
ORDER BY travelled_distance DESC, u.name ASC;

```

`COALESCE(SUM(r.distance), 0)`는 SQL 쿼리에서 사용되는 함수입니다. 이 함수는 여러 개의 인수를 받아 첫 번째로 NULL이 아닌 값을 반환합니다.

위의 쿼리에서 `SUM(r.distance)`는 Rides 테이블에서 각 사용자의 주행 거리를 합산한 값을 나타냅니다. 그러나 일부 사용자는 Rides 테이블에 주행 기록이 없을 수 있습니다. 따라서 합산 결과가 NULL일 수 있습니다.

이 때 COALESCE 함수는 첫 번째 인수인 `SUM(r.distance)`의 결과를 검사하여 NULL이 아니면 해당 값을 반환하고, NULL이면 두 번째 인수인 0을 반환합니다. 따라서 주행 거리의 합산 결과가 NULL일 경우에는 0으로 대체되어 표시됩니다.

즉, `COALESCE(SUM(r.distance), 0)`는 주행 거리의 합산 결과가 NULL일 경우 0으로 대체하여 반환하는 역할을 합니다.