# 3월 1주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

### 오랜 기간 보호한 동물(1)

```sql
SELECT *
FROM (
    SELECT animal_ins.name, 
           animal_ins.datetime
    FROM animal_ins 
    LEFT JOIN animal_outs ON animal_ins.animal_id = animal_outs.animal_id
    WHERE animal_outs.datetime IS NULL
    ORDER BY animal_ins.datetime ASC
)
WHERE ROWNUM <= 3;
```

### 즐겨찾기가 가장 많은 식당 정보 출력하기

```sql
WITH A AS (
    SELECT  FOOD_TYPE,
            MAX(FAVORITES) AS FAVORITES
    FROM    REST_INFO
    GROUP BY FOOD_TYPE
)
SELECT  B.FOOD_TYPE,
        B.REST_ID,
        B.REST_NAME,
        B.FAVORITES
FROM    A
        JOIN REST_INFO B
        ON A.FAVORITES = B.FAVORITES AND A.FOOD_TYPE = B.FOOD_TYPE
ORDER BY A.FOOD_TYPE DESC;
```

### 카테고리 별 도서 판매량 집계하기

```sql
SELECT      B.CATEGORY
            , SUM(S.SALES) AS TOTAL_SALES
FROM        BOOK B
JOIN        BOOK_SALES S
ON          B.BOOK_ID = S.BOOK_ID
WHERE       YEAR(S.SALES_DATE) = 2022
            AND MONTH(S.SALES_DATE) = 1
GROUP BY    B.CATEGORY
ORDER BY    B.CATEGORY;
```