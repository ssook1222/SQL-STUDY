# 10월 5주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

`문제 플랫폼`    
 해커랭크
 - **SQL Intermediate Certificate 2문항**

### 1.

```sql
SELECT  p.sku
        , p.product_name
FROM    PRODUCT p LEFT OUTER JOIN INVOICE_ITEM i
ON      p.id = i.product_id
WHERE   i.invoice_id is NULL
```

### 2.

```sql
SELECT  co.country_name, 
				count(*), 
				AVG(i.total_price)
FROM country co, city ci, customer cu, invoice i
WHERE co.id = ci.country_id AND ci.id = cu.city_id AND cu.id = i.customer_id
GROUP BY co.country_name
HAVING AVG(i.total_price) > (SELECT AVG(total_price) FROM invoice)
```

---

![1106](https://github.com/ssook1222/SQL-STUDY/assets/60427387/b1884441-35e6-4183-b8fc-b0ce580dceb8)

