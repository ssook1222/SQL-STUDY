# 12월 1주차(=11월 4주차) 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** LeetCode

---

### 1075. Project Employees I

```sql
SELECT  PROJECT_ID
        , ROUND(AVG(EXPERIENCE_YEARS), 2) AS AVERAGE_YEARS
FROM    PROJECT P INNER JOIN EMPLOYEE E ON P.EMPLOYEE_ID = E.EMPLOYEE_ID
GROUP BY PROJECT_ID
ORDER BY PROJECT_ID
```

### 1633. Percentage of Users Attended a Contest

```sql
WITH ALL_USER AS (
        SELECT  COUNT(USER_ID) AS ALL_CNT
        FROM USERS
)
SELECT  CONTEST_ID
        , ROUND((COUNT(U.USER_ID) / ALL_CNT) * 100, 2) AS PERCENTAGE
FROM USERS U INNER JOIN REGISTER R ON U.USER_ID = R.USER_ID, ALL_USER
GROUP BY CONTEST_ID
ORDER BY PERCENTAGE DESC, CONTEST_ID
```

### 1070. Product Sales Analysis III

```sql
WITH A AS (
SELECT  S.PRODUCT_ID
        , MIN(YEAR) AS YEAR
FROM    SALES S INNER JOIN PRODUCT P ON S.PRODUCT_ID = P.PRODUCT_ID
GROUP BY PRODUCT_ID
)

SELECT A.PRODUCT_ID
        , A.YEAR AS FIRST_YEAR
        , S.QUANTITY
        , S.PRICE
FROM A INNER JOIN SALES S ON A.PRODUCT_ID = S.PRODUCT_ID AND A.YEAR = S.YEAR
```