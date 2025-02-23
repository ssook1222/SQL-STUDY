# 1월 2주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

### 없어진 기록 찾기

```sql
SELECT animal_outs.animal_id, 
       animal_outs.name
FROM animal_outs 
LEFT JOIN animal_ins ON animal_outs.animal_id = animal_ins.animal_id
WHERE animal_ins.animal_id IS NULL;

```

### 자동차 대여 기록에서 대여중 / 대여 가능 여부 구분하기

```sql
WITH TEST AS (
    SELECT CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE '2022-10-16' BETWEEN START_DATE AND END_DATE
)
SELECT DISTINCT C.CAR_ID,
       CASE 
           WHEN TEST.CAR_ID IS NULL THEN '대여 가능'
           WHEN TEST.CAR_ID IS NOT NULL THEN '대여중'
       END AS AVAILABILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY C
LEFT JOIN TEST ON C.CAR_ID = TEST.CAR_ID
ORDER BY C.CAR_ID DESC;

```

### 식품분류별 가장 비싼 식품의 정보 조회하기

```sql
WITH A AS (
    SELECT CATEGORY, 
           MAX(PRICE) AS PRICE
    FROM FOOD_PRODUCT
    WHERE CATEGORY IN ('과자', '국', '김치', '식용유')
    GROUP BY CATEGORY
)
SELECT A.CATEGORY, 
       A.PRICE AS MAX_PRICE, 
       B.PRODUCT_NAME
FROM A
INNER JOIN FOOD_PRODUCT B 
    ON A.CATEGORY = B.CATEGORY
   AND A.PRICE = B.PRICE
ORDER BY MAX_PRICE DESC;

```