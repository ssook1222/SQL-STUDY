# 8월 3주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** Leetcode, 프로그래머스


### **586. Customer Placing the Largest Number of Orders**

```sql
SELECT CUSTOMER_NUMBER
FROM ORDERS
GROUP BY CUSTOMER_NUMBER
ORDER BY COUNT(ORDER_NUMBER) DESC
LIMIT 1
```

### 특정 세대의 대장균 찾기

```sql
WITH RECURSIVE GENERATIONS AS (
    SELECT  ID,
            PARENT_ID,
            1 AS GENERATION
    FROM    ECOLI_DATA
    WHERE   PARENT_ID IS NULL
    
    UNION ALL

    SELECT  A.ID,
            A.PARENT_ID,
            B.GENERATION + 1 AS GENERATION
    FROM    ECOLI_DATA AS A JOIN GENERATIONS AS B ON A.PARENT_ID = B.ID
)

SELECT  ID
FROM    GENERATIONS
WHERE   GENERATION = 3
ORDER BY    ID;
```

### 멸종위기의 대장균 찾기

```sql
WITH RECURSIVE CTE AS (
    SELECT ID
            ,PARENT_ID
            ,1 AS LEVEL 
    FROM ECOLI_DATA
    WHERE PARENT_ID IS NULL
    
    UNION ALL
    
    SELECT E.ID
            ,E.PARENT_ID
            ,1+C.LEVEL
    FROM ECOLI_DATA E INNER JOIN CTE C
        ON E.PARENT_ID = C.ID
),

T AS (
    SELECT PARENT_ID
           , COUNT(PARENT_ID) AS CNT
    FROM CTE
    GROUP BY LEVEL, PARENT_ID
)

SELECT COUNT(*) AS 'COUNT'
        ,LEVEL AS GENERATION
FROM CTE C LEFT OUTER JOIN T ON C.ID = T.PARENT_ID
WHERE T.PARENT_ID IS NULL
GROUP BY LEVEL
ORDER BY GENERATION;
```