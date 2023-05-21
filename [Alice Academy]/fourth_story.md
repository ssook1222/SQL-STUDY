### 가게 DB 구축하기

```sql
INSERT INTO product VALUES(1, 'carrot', 100, '2019-04-10', 1000, 900);
INSERT INTO product VALUES(2, 'tea', 1000, '2020-02-10', 1000, 900);
INSERT INTO product VALUES(3, 'clock', 100, null , 200000, 180000);

SELECT  *
FROM    product
```

### 가게 DB 분석하기

```sql
SELECT COUNT(*) 
FROM (
    SELECT NAME, COUNT(*) 
    FROM product 
    GROUP BY NAME
) AS KIND;

SELECT SUM(STOCK)
FROM product;

SELECT MAX(SELLING_PRICE)
FROM product
```

### 유통기한이 얼마 남지 않은 물건 확인하기

```sql
SELECT *
FROM product
WHERE expiration_date < '2019-05-01';

SELECT sum(stock)
FROM product
WHERE expiration_date < '2019-05-01';
```

### 판매기록 출력하기

```sql
select * from sale right join product on product.id = sale.product_id;
```

### 물건별 판매량 출력하기

```sql
select product_id
        , sum(amount)
from sale
group by product_id
having COUNT(product_id) > 1
```