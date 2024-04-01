# 4월 1주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** programmers

---

### **대장균들의 자식의 수 구하기**

```sql
WITH A AS (
SELECT  E1.ID
        , COUNT(*) AS CHILD_COUNT
FROM    ECOLI_DATA E1 INNER JOIN ECOLI_DATA E2 
        ON E1.ID = E2.PARENT_ID
GROUP BY E1.ID
)

SELECT  B.ID, 
        COALESCE(A.CHILD_COUNT, 0) AS CHILD_COUNT
FROM    A RIGHT OUTER JOIN ECOLI_DATA B ON A.ID = B.ID
ORDER BY B.ID
```

---

### **한 해에 잡은 물고기 수 구하기**

```sql
SELECT      COUNT(*) AS FISH_COUNT
FROM        FISH_INFO FI
WHERE       YEAR(TIME) = 2021
```

---

### 잡은 물고기 중 가장 큰 물고기의 길이 구하기

```sql
SELECT      CONCAT(MAX(LENGTH), 'cm') AS MAX_LENGTH
FROM        FISH_INFO FI
```