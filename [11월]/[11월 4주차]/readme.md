# 11월 4주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** LeetCode

---

### 197. Rising Temperature

```sql
SELECT DISTINCT A.ID
FROM  Weather A,
			Weather B
WHERE A.Temperature > B.Temperature
AND DATEDIFF(A.Recorddate, B.Recorddate) = 1
```

### 1211. Queries Quality and Percentage

```sql
SELECT  QUERY_NAME
        , ROUND((SUM(RATING / POSITION))/COUNT(QUERY_NAME), 2) AS QUALITY
        , ROUND((SUM(CASE WHEN RATING < 3 THEN 1 ELSE 0 END) / COUNT(QUERY_NAME)) * 100, 2) AS POOR_QUERY_PERCENTAGE
FROM    QUERIES
GROUP BY QUERY_NAME
```

### 610. Triangle Judgement

```sql
SELECT
    x,
    y,
    z,
    CASE
        WHEN x + y > z AND y + z > x AND z + x > y AND x > 0 AND y > 0 AND z > 0 THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM
    Triangle;
```