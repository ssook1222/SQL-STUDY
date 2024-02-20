# 2월 4주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** leetcode

---

### 627. Swap Salary

```sql
UPDATE SALARY
SET SEX = CASE
    WHEN SEX = 'm' THEN 'f'
    WHEN SEX = 'f' THEN 'm'
    END;
```

### **178. Rank Scores**

```sql
SELECT SCORE,
        DENSE_RANK() OVER (ORDER BY SCORE DESC) AS 'RANK'
FROM SCORES
ORDER BY SCORE DESC;
```

`DENSE_RANK()`는 윈도우 함수 중 하나로, 순위를 할당하는 데 사용됨. 
이 함수는 중복된 값이 있을 때 순위를 할당하되, 중복된 값에 대해 중간 순위를 건너뛰지 않고 순차적으로 순위를 부여함. 
또한 해당 함수는 순위가 연속적으로 할당되는 것을 보장함.

cf ) `RANK()`
`RANK()` 함수는 또 다른 윈도우 함수로, 순위를 할당하는 데 사용됨. 
그러나 `DENSE_RANK()` 함수와는 달리 중복된 값이 있을 때 순위를 건너뛰지 않음. 
즉, 순차적으로 순위를 부여하는 대신 동일한 값을 가진 항목에 대해 
동일한 순위를 부여한 다음 다음 순위는 해당 순위의 개수에 해당하는 만큼 건너뜁니다.
### 1179. Reformat Department Table

```sql
SELECT 
    id,
    MAX(CASE WHEN month = 'Jan' THEN revenue END) AS Jan_Revenue,
    MAX(CASE WHEN month = 'Feb' THEN revenue END) AS Feb_Revenue,
    MAX(CASE WHEN month = 'Mar' THEN revenue END) AS Mar_Revenue,
    MAX(CASE WHEN month = 'Apr' THEN revenue END) AS Apr_Revenue,
    MAX(CASE WHEN month = 'May' THEN revenue END) AS May_Revenue,
    MAX(CASE WHEN month = 'Jun' THEN revenue END) AS Jun_Revenue,
    MAX(CASE WHEN month = 'Jul' THEN revenue END) AS Jul_Revenue,
    MAX(CASE WHEN month = 'Aug' THEN revenue END) AS Aug_Revenue,
    MAX(CASE WHEN month = 'Sep' THEN revenue END) AS Sep_Revenue,
    MAX(CASE WHEN month = 'Oct' THEN revenue END) AS Oct_Revenue,
    MAX(CASE WHEN month = 'Nov' THEN revenue END) AS Nov_Revenue,
    MAX(CASE WHEN month = 'Dec' THEN revenue END) AS Dec_Revenue
FROM 
    Department
GROUP BY 
    id
```
