
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
