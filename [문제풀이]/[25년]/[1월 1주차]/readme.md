# 1월 1주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

### 이름에 el이 들어가는 동물 찾기

```sql
SELECT  ANIMAL_ID,
        NAME
FROM    ANIMAL_INS
WHERE   LOWER(NAME) LIKE '%el%' 
        AND ANIMAL_TYPE = 'Dog'
ORDER BY    NAME;
```

### DATETIME에서 DATE로 형 변환

```sql
SELECT  ANIMAL_ID,
        NAME,
        DATE_FORMAT(DATETIME, '%Y-%m-%d') AS 날짜
FROM    ANIMAL_INS
ORDER BY    ANIMAL_ID;
```

### 카테고리 별 상품 개수 구하기

```sql
SELECT      SUBSTRING(PRODUCT_CODE, 1, 2) AS CATEGORY,
            COUNT(*) AS PRODUCTS
FROM        PRODUCT
GROUP BY    SUBSTRING(PRODUCT_CODE, 1, 2)
ORDER BY    SUBSTRING(PRODUCT_CODE, 1, 2);
```