# 11월 1주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** 프로그래머스

### 5월 식품들의 총매출 조회하기

```sql
SELECT food_product.product_id, 
       product_name, 
       SUM(price * amount) AS total_sales
FROM food_product 
JOIN food_order ON food_product.product_id = food_order.product_id
WHERE TO_CHAR(produce_date, 'YYYY') = '2022' 
  AND TO_CHAR(produce_date, 'MM') = '05'
GROUP BY food_product.product_id, product_name
ORDER BY total_sales DESC, food_product.product_id ASC;
```

### 조건에 맞는 도서와 저자 리스트 출력하기

```sql
SELECT B.BOOK_ID, 
       A.AUTHOR_NAME,
       DATE_FORMAT(B.PUBLISHED_DATE, '%Y-%m-%d') AS PUBLISHED_DATE
FROM BOOK B 
INNER JOIN AUTHOR A ON B.AUTHOR_ID = A.AUTHOR_ID
WHERE B.CATEGORY = '경제'
ORDER BY B.PUBLISHED_DATE;
```

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