# 4월 1주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

### NULL 처리하기

```sql
SELECT      ANIMAL_TYPE,
            CASE 
                WHEN NAME IS NULL THEN 'No name'
                ELSE NAME
            END AS NAME,
            SEX_UPON_INTAKE        
FROM        ANIMAL_INS
ORDER BY    ANIMAL_ID;
```

### 이름에 el이 들어가는 동물 찾기

```sql
SELECT  ANIMAL_ID,
        NAME
FROM    ANIMAL_INS
WHERE   LOWER(NAME) LIKE '%el%' 
        AND ANIMAL_TYPE = 'Dog'
ORDER BY    NAME;
```

### 경기도에 위치한 식품창고 목록 출력하기

```sql
SELECT PRODUCT_ID, PRODUCT_NAME, PRODUCT_CD, CATEGORY, PRICE
FROM FOOD_PRODUCT
ORDER BY PRICE DESC
FETCH FIRST 1 ROWS ONLY;
```