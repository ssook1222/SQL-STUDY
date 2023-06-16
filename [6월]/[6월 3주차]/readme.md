# 6월 3주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

`문제 플랫폼`    
HackerRank




## 6월 11일

### Weather Observation Station 15

```sql
    SELECT ROUND(LONG_W,4)
    FROM STATION
    WHERE LAT_N < 137.2345 
    ORDER BY LAT_N DESC LIMIT 1;
```

### Weather Observation Station 16


```sql
    SELECT  ROUND(MIN(LAT_N), 4)
    FROM    STATION
    WHERE   LAT_N > 38.7780;
```

### Weather Observation Station 17


```sql
    SELECT  ROUND(LONG_W, 4)
    FROM    STATION
    WHERE   LAT_N > 38.7780
    ORDER BY LAT_N 
    LIMIT 1;
```

---

## 6월 12일 

### African Cities

```sql
SELECT      A.NAME
FROM        CITY A INNER JOIN COUNTRY B
ON          A.COUNTRYCODE = B.CODE
WHERE       B.CONTINENT = 'Africa';

```

### **The Report**

```sql
SELECT CASE WHEN B.GRADE >= 8 THEN A.NAME ELSE NULL END AS NAME,
       B.GRADE,
       A.MARKS
FROM STUDENTS A
INNER JOIN GRADES B ON A.MARKS BETWEEN B.MIN_MARK AND B.MAX_MARK
ORDER BY CASE WHEN B.GRADE >= 8 THEN -B.GRADE END ASC,
         CASE WHEN B.GRADE >= 8 THEN A.NAME END ASC, 
         CASE WHEN B.GRADE < 8 THEN -B.GRADE END ASC,
         CASE WHEN B.GRADE < 8 THEN A.MARKS END ASC;

```

-   **ORDER BY**에도 `**CASE WHEN THEN 문을 사용 가능**`하다!

### **Weather Observation Station 18**

```sql
SELECT  ROUND((MAX(LAT_N) - MIN(LAT_N)) + (MAX(LONG_W) - MIN(LONG_W)), 4)
FROM    STATION;

```

---

##  6월 13일

### **Weather Observation Station 19**

```sql
SELECT 
    ROUND(SQRT(POW(MIN(LAT_N) - MAX(LAT_N), 2) + POW(MIN(LONG_W) - MAX(LONG_W), 2)), 4) AS distance
FROM 
    STATION;

```

### **The PADS**

```sql
SELECT  CONCAT(NAME, '(',LEFT(OCCUPATION, 1),')') AS RESULT
FROM    OCCUPATIONS
ORDER BY RESULT;

SELECT CONCAT('There are a total of ', COUNT(occupation), ' ', LOWER(occupation), 's.') AS result
FROM OCCUPATIONS
GROUP BY occupation
ORDER BY COUNT(occupation), LOWER(occupation);

```

### **1327. List the Products Ordered in a Period**

```sql
SELECT      A.PRODUCT_NAME
            , SUM(B.UNIT) AS UNIT
FROM        PRODUCTS A INNER JOIN ORDERS B
ON          A.PRODUCT_ID = B.PRODUCT_ID
WHERE       EXTRACT(MONTH FROM B.ORDER_DATE) = 2 
GROUP BY    A.PRODUCT_NAME
HAVING      SUM(B.UNIT) >= 100
ORDER BY    SUM(B.UNIT)

```

---

## 6월 14일
### **Weather Observation Station 20**

```sql
SELECT ROUND(MEDIAN(LAT_N),4)
FROM STATION;

```

### **1251. Average Selling Price**

```sql
SELECT
        p.product_id,
        ROUND(SUM(u.units * p.price)/SUM(u.units), 2) AS average_price
FROM
        UnitsSold u
JOIN
        Prices p 
        ON u.product_id = p.product_id
        AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY
        p.product_id

```

### **196. Delete Duplicate Emails**

```sql
DELETE FROM Person
WHERE id NOT IN (
    SELECT MIN(id)
    FROM Person
    GROUP BY email
)

```

WHERE절 서브쿼리 사용해서 해결 가능!


