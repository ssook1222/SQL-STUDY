# 4월 3주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** programmers

---

### 특정 조건을 만족하는 물고기별 수와 최대 길이 구하기

```sql
WITH RAW AS (
    SELECT FISH_TYPE,
           COALESCE(LENGTH, 10) AS LENGTH,
           ID
    FROM FISH_INFO
), 

AVG_GROUPS AS (
    SELECT AVG(LENGTH) AS AVERAGE,
           FISH_TYPE
    FROM RAW
    GROUP BY FISH_TYPE
)

SELECT COUNT(*) AS FISH_COUNT,
       MAX(LENGTH) AS MAX_LENGTH,
       A.FISH_TYPE
FROM AVG_GROUPS A
INNER JOIN FISH_INFO F ON A.FISH_TYPE = F.FISH_TYPE
WHERE A.AVERAGE >= 33
GROUP BY A.FISH_TYPE
ORDER BY A.FISH_TYPE
```

### 부모의 형질을 모두 가지는 대장균 찾기

```sql
SELECT      A.ID
            , A.GENOTYPE
            , B.GENOTYPE AS PARENT_GENOTYPE
FROM        ECOLI_DATA AS A INNER JOIN ECOLI_DATA AS B ON A.PARENT_ID = B.ID
WHERE       (A.GENOTYPE & B.GENOTYPE) = B.GENOTYPE
ORDER BY    A.ID
```

### 대장균의 크기에 따라 분류하기 2

```sql
WITH BUNJA_COUNT AS (
    SELECT  E1.ID
            , COUNT(e2.ID) AS BUNJA_COUNT
    FROM    ECOLI_DATA AS E1 LEFT JOIN ECOLI_DATA AS E2 ON E2.SIZE_OF_COLONY >= E1.SIZE_OF_COLONY
    GROUP BY E1.ID
), 
BUNMO AS (
    SELECT  COUNT(*) AS BUNMO_COUNT 
    FROM    ECOLI_DATA
)

SELECT  E1.ID
        , CASE    WHEN BUNJA.BUNJA_COUNT / BUNMO.BUNMO_COUNT <= 0.25 THEN 'CRITICAL'
                  WHEN BUNJA.BUNJA_COUNT / BUNMO.BUNMO_COUNT <= 0.50 THEN 'HIGH'
                  WHEN BUNJA.BUNJA_COUNT / BUNMO.BUNMO_COUNT <= 0.75 THEN 'MEDIUM'
                  ELSE 'LOW'
                  END AS COLONY_NAME
FROM    BUNJA_COUNT AS BUNJA
JOIN    BUNMO
JOIN    ECOLI_DATA AS e1 ON BUNJA.ID = e1.ID
ORDER BY E1.ID;

```