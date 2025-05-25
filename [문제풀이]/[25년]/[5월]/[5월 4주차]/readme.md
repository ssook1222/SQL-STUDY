# 5월 4주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

### 언어별 개발자 분류하기

```sql
WITH fe AS (
    SELECT BIT_OR(code) AS skill_code 
    FROM skillcodes 
    GROUP BY category 
    HAVING category = 'Front End'
), dev_grade AS (
    SELECT
        CASE
            WHEN dev.skill_code & fe.skill_code 
                AND dev.skill_code & (SELECT code FROM skillcodes WHERE name = 'Python')
                THEN 'A'
            WHEN dev.skill_code & (SELECT code FROM skillcodes WHERE name = 'C#') 
                THEN 'B'
            WHEN dev.skill_code & fe.skill_code 
                THEN 'C'
            ELSE NULL
        END AS grade
        , id
        , email
    FROM
        developers dev
        , fe
)

SELECT
    grade
    , id
    , email
FROM
    dev_grade
WHERE
    grade IS NOT NULL
ORDER BY
    grade, id;
```

### 특정 형질을 가지는 대장균 찾기

```sql
SELECT      COUNT(*) AS COUNT
FROM        ECOLI_DATA
WHERE       (GENOTYPE & 2) = 0 AND ((GENOTYPE & 1) = 1 OR (GENOTYPE & 4) = 4);
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