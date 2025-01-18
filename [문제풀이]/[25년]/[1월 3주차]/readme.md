# 1월 3주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

### 그룹별 조건에 맞는 식당 목록 출력하기

```sql
SELECT 
    member_profile.member_name, 
    review_text, 
    TO_CHAR(review_date, 'YYYY-MM-DD') AS review_date
FROM 
    rest_review 
JOIN 
    member_profile 
ON 
    member_profile.member_id = rest_review.member_id
WHERE 
    rest_review.member_id = (
        SELECT member_id
        FROM (
            SELECT member_id, COUNT(*) AS review_count
            FROM rest_review
            GROUP BY member_id
            ORDER BY COUNT(*) DESC
        ) 
        WHERE ROWNUM = 1
    )
ORDER BY 
    review_date ASC;
```

### 주문량이 많은 아이스크림들 조회하기

```sql
WITH ANS AS (
    SELECT A.FLAVOR, A.TOTAL_ORDER
    FROM JULY A

    UNION ALL

    SELECT B.FLAVOR, B.TOTAL_ORDER
    FROM FIRST_HALF B
)
SELECT FLAVOR
FROM ANS
GROUP BY FLAVOR
ORDER BY SUM(ANS.TOTAL_ORDER) DESC
LIMIT 3;
```

### **상품을 구매한 회원 비율 구하기**

```sql
-- Step 1: Calculate the total number of distinct users who joined in 2021
SET @join_2021 := (
    SELECT COUNT(DISTINCT F.USER_ID)
    FROM USER_INFO F
    WHERE DATE_FORMAT(JOINED, '%Y-%m-%d') LIKE '2021-%'
);

-- Step 2: Calculate the number of distinct users who made purchases in 2021
SELECT 
    YEAR(N.SALES_DATE) AS YEAR,
    MONTH(N.SALES_DATE) AS MONTH,
    COUNT(DISTINCT N.USER_ID) AS PURCHASED_USERS,
    ROUND(COUNT(DISTINCT N.USER_ID) / @join_2021, 1) AS PURCHASED_RATIO
FROM 
    ONLINE_SALE N
INNER JOIN 
    USER_INFO F ON N.USER_ID = F.USER_ID 
    AND DATE_FORMAT(F.JOINED, '%Y-%m-%d') LIKE '2021-%'
GROUP BY 
    YEAR(N.SALES_DATE), MONTH(N.SALES_DATE)
ORDER BY 
    YEAR ASC, MONTH ASC;

```
