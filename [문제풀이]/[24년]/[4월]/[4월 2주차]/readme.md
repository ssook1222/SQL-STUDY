# 4월 2주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** programmers

---

### 특정 형질을 가지는 대장균 찾기

```sql
SELECT      COUNT(*) AS COUNT
FROM        ECOLI_DATA
WHERE       (GENOTYPE & 2) = 0 AND ((GENOTYPE & 1) = 1 OR (GENOTYPE & 4) = 4);
```

- **`(GENOTYPE & 2) = 0`**
    
    2번 형질을 보유하지 않는 대장균을 선택.
    
    여기서 `**&는 비트 AND 연산자**`이며, 2번 형질을 나타내는 비트는 2진수에서 10으로 표현됨.
    
    그래서 이 비트와 대장균의 형질을 AND 연산하여 결과가 0이 나오면 2번 형질을 보유하지 않는 대장균을 선택하게 됨.
    

---

### 대장균의 크기에 따라 분류하기 1

```sql
SELECT  ID,
        CASE 
            WHEN SIZE_OF_COLONY <= 100 THEN 'LOW'
            WHEN SIZE_OF_COLONY > 100 AND SIZE_OF_COLONY <= 1000 THEN 'MEDIUM'
            WHEN SIZE_OF_COLONY > 1000 THEN 'HIGH'
        END AS SIZE
FROM    ECOLI_DATA
ORDER BY ID
```

---

### 연도별 대장균 크기의 편차 구하기

```sql
WITH A AS (
    SELECT  YEAR(DIFFERENTIATION_DATE) AS YEAR,
            MAX(SIZE_OF_COLONY) AS LARGEST
    FROM    ECOLI_DATA
    GROUP BY YEAR(DIFFERENTIATION_DATE)
)

SELECT  YEAR(E.DIFFERENTIATION_DATE) AS YEAR,
        A.LARGEST - E.SIZE_OF_COLONY AS YEAR_DEV,
        E.ID
FROM    ECOLI_DATA E 
INNER JOIN A ON YEAR(E.DIFFERENTIATION_DATE) = A.YEAR
ORDER BY YEAR, YEAR_DEV

```