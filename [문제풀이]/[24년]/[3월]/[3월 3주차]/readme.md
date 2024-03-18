# 3월 3주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** programmers

---

### **물고기 종류 별 잡은 수 구하기**

```sql
SELECT          COUNT(*) AS FISH_COUNT,
                N.FISH_NAME
FROM            FISH_INFO I  INNER JOIN FISH_NAME_INFO N ON I.FISH_TYPE = N.FISH_TYPE
GROUP BY        N.FISH_NAME
ORDER BY        FISH_COUNT DESC
```

### 월별 잡은 물고기 수 구하기

```sql
SELECT      COUNT(*) AS FISH_COUNT
            , MONTH(TIME) AS MONTH
FROM        FISH_INFO
GROUP BY    MONTH(TIME)
ORDER BY    MONTH(TIME)
```

### 잡은 물고기의 평균 길이 구하기

```sql
WITH A AS (
    SELECT      COALESCE(LENGTH, 10) AS LENGTH
    FROM        FISH_INFO
)

SELECT      ROUND(AVG(LENGTH), 2) AS AVERAGE_LENGTH
FROM        A
```