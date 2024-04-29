
# 4월 5주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** Leetcode

### Recyclable and low fat products

```sql
SELECT      PRODUCT_ID
FROM        PRODUCTS
WHERE       LOW_FATS = 'Y' AND RECYCLABLE = 'Y' 
```

### Find customer referee

```sql
SELECT      NAME
FROM        CUSTOMER
WHERE       REFEREE_ID != 2 OR REFEREE_ID IS NULL
```

### Big countries

```sql
SELECT  NAME
        , POPULATION
        , AREA
FROM    WORLD
WHERE   AREA >= 3000000 OR POPULATION >= 25000000
```
----
### 업그레이드 된 아이템 구하기

```sql
WITH RAW AS (
    SELECT ITEM_ID
    FROM ITEM_INFO
    WHERE RARITY='RARE'
)

SELECT  A.ITEM_ID
			 , A.ITEM_NAME
			 , A.RARITY
FROM ITEM_INFO A
INNER JOIN ITEM_TREE B ON A.ITEM_ID = B.ITEM_ID
WHERE B.PARENT_ITEM_ID IN (SELECT ITEM_ID FROM RAW)
ORDER BY A.ITEM_ID DESC
```

### 물고기 종류 별 대어 찾기

```sql
WITH ML AS (
    SELECT      MAX(LENGTH) AS LENGTH
                , FISH_TYPE
    FROM        FISH_INFO
    GROUP BY    FISH_TYPE
),
MN AS (
    SELECT  ID
            , ML.FISH_TYPE
            , ML.LENGTH
            , TIME
    FROM    FISH_INFO I INNER JOIN ML ON I.LENGTH = ML.LENGTH AND I.FISH_TYPE = ML.FISH_TYPE
)

SELECT      ID
            , FISH_NAME
            , LENGTH
FROM        FISH_NAME_INFO FNI INNER JOIN MN ON FNI.FISH_TYPE = MN.FISH_TYPE
ORDER BY    ID
```

### 분기별 분화된 대장균의 개체 수 구하기

```sql
WITH A AS
( 
    SELECT      ID
            , CASE 
                WHEN MONTH(DIFFERENTIATION_DATE) BETWEEN 1 AND 3 THEN '1Q'
                WHEN MONTH(DIFFERENTIATION_DATE) BETWEEN 4 AND 6 THEN '2Q'
                WHEN MONTH(DIFFERENTIATION_DATE) BETWEEN 7 AND 9 THEN '3Q'
                WHEN MONTH(DIFFERENTIATION_DATE) BETWEEN 10 AND 12 THEN '4Q'
            END AS QUARTER
    FROM        ECOLI_DATA
)

SELECT      QUARTER,
            COUNT(ID) AS ECOLI_COUNT
FROM        A
GROUP BY    QUARTER
ORDER BY    QUARTER
```