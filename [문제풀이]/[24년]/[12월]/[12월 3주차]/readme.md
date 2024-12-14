# 12월 3주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** 프로그래머스

### **있었는데요 없었습니다**

```sql
SELECT animal_ins.animal_id, animal_ins.name
FROM animal_ins 
JOIN animal_outs ON animal_ins.animal_id = animal_outs.animal_id
WHERE animal_ins.datetime > animal_outs.datetime
ORDER BY animal_ins.datetime ASC;
```

### 상품 별 오프라인 매출 구하기

```sql
SELECT p.product_code, SUM(a.amount * p.price) AS sales
FROM product p
JOIN (
    SELECT product_id, SUM(sales_amount) AS amount
    FROM offline_sale
    GROUP BY product_id
) a ON p.product_id = a.product_id
GROUP BY p.product_code, p.price
ORDER BY sales DESC, p.product_code ASC;

```

### 보호소에서 중성화한 동물

```sql
SELECT ao.animal_id, ao.animal_type, ao.name
FROM animal_outs ao
LEFT JOIN animal_ins ai ON ao.animal_id = ai.animal_id
WHERE SUBSTR(ai.sex_upon_intake, 1, 6) = 'Intact'
AND ai.sex_upon_intake != ao.sex_upon_outcome;
```