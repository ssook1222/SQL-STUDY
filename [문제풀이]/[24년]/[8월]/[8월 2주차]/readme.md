# 8월 2주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** Leetcode


### 184. Department Highest Salary

``` sql
SELECT  Department.Name AS Department
        , e1.Name AS Employee
        , e1.Salary AS Salary
FROM Department JOIN Employee e1 ON Department.Id = e1.DepartmentId
WHERE e1.Salary = (SELECT Max(Salary) FROM Employee e2 WHERE e2.DepartmentId = e1.DepartmentId)
```

### 601. Human Traffic of Stadium

```sql
WITH
    S AS (
        SELECT
            *,
            id - (ROW_NUMBER() OVER (ORDER BY id)) AS rk
        FROM Stadium
        WHERE people >= 100
    ),
    T AS (SELECT *, COUNT(1) OVER (PARTITION BY rk) AS cnt FROM S)
SELECT id, visit_date, people
FROM T
WHERE cnt >= 3
ORDER BY 1;
```


### 177. Nth Highest Salary

```sql
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  SET N = N - 1;
  RETURN (
      SELECT DISTINCT Salary FROM Employee ORDER BY Salary DESC LIMIT N,1
  );
END
```