# 2월 5주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** programmers

---

### Root 아이템 구하기

```sql
SELECT  A.ITEM_ID
        , A.ITEM_NAME
FROM    ITEM_INFO A INNER JOIN ITEM_TREE B ON A.ITEM_ID = B.ITEM_ID
WHERE   B.PARENT_ITEM_ID IS NULL
ORDER BY    A.ITEM_ID
```

### Python 개발자 찾기

```sql
SELECT      ID 
            , EMAIL
            , FIRST_NAME
            , LAST_NAME
FROM        DEVELOPER_INFOS
WHERE       SKILL_1 = 'Python' OR SKILL_2 = 'Python' OR SKILL_3 = 'Python'
ORDER BY    ID
```

### 조건에 맞는 아이템들의 가격의 총합 구하기

```sql
SELECT  SUM(PRICE) AS TOTAL_PRICE
FROM    ITEM_INFO I
WHERE   I.RARITY = 'LEGEND'
```