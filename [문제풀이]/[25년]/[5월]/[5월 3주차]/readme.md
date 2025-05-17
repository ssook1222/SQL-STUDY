# 5월 3주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

### FrontEnd 개발자 찾기

```sql
SELECT      DISTINCT D.ID,
            D.EMAIL,
            D.FIRST_NAME,
            D.LAST_NAME
FROM        DEVELOPERS D INNER JOIN  SKILLCODES S 
            ON (D.SKILL_CODE & S.CODE) = S.CODE
WHERE       S.CATEGORY = 'Front End'
ORDER BY    D.ID ASC;
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

### 업그레이드 된 아이템 구하기

```sql
WITH RAW AS (
    SELECT ITEM_ID
    FROM ITEM_INFO
    WHERE RARITY='RARE'
)

SELECT A.ITEM_ID, A.ITEM_NAME, A.RARITY
FROM ITEM_INFO A
INNER JOIN ITEM_TREE B ON A.ITEM_ID = B.ITEM_ID
WHERE B.PARENT_ITEM_ID IN (SELECT ITEM_ID FROM RAW)
ORDER BY A.ITEM_ID DESC
```