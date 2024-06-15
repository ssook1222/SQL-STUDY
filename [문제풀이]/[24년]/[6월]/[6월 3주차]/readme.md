# 6월 3주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** Leetcode

### **1978. Employees Whose Manager Left the Company**

```sql
WITH ManagersLeft AS (
    SELECT e1.manager_id
    FROM Employees e1
    LEFT JOIN Employees e2 ON e1.manager_id = e2.employee_id
    WHERE e2.employee_id IS NULL
)

SELECT employee_id
FROM Employees
WHERE salary < 30000
  AND manager_id IS NOT NULL
  AND manager_id IN (SELECT manager_id FROM ManagersLeft)
ORDER BY employee_id;
```

### **1527. Patients With a Condition**

```sql
SELECT  patient_id
        , patient_name
        , conditions
FROM Patients
FROM Patients
WHERE conditions LIKE 'DIAB1%' OR conditions LIKE '% DIAB1%'
```

### **196. Delete Duplicate Emails**

```sql
DELETE p1
FROM Person p1
JOIN Person p2
ON p1.email = p2.email
AND p1.id > p2.id;
```