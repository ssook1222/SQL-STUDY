# 10월 3주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** 프로그래머스

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

### 저자 별 카테고리 별 매출액 집계하기

```sql
SELECT B.AUTHOR_ID, B.AUTHOR_NAME, A.CATEGORY, SUM(A.TOTAL_SALES) AS TOTAL_SALES
FROM (
    SELECT A.AUTHOR_ID, A.BOOK_ID, A.CATEGORY, B.SALES_DATE, (B.SALES * A.PRICE) AS TOTAL_SALES
    FROM BOOK A
    INNER JOIN BOOK_SALES B ON A.BOOK_ID = B.BOOK_ID
    WHERE YEAR(B.SALES_DATE) = 2022 AND MONTH(B.SALES_DATE) = 1
) A
INNER JOIN AUTHOR B ON A.AUTHOR_ID = B.AUTHOR_ID
GROUP BY A.CATEGORY, B.AUTHOR_ID, B.AUTHOR_NAME
ORDER BY B.AUTHOR_ID ASC, A.CATEGORY DESC;

```

### 자동차 종류 별 특정 옵션이 포함된 자동차 수 구하기

```sql
SELECT      CAR_TYPE
            , COUNT(*) AS CARS
FROM        CAR_RENTAL_COMPANY_CAR
WHERE       OPTIONS LIKE '%통풍시트%' OR OPTIONS LIKE '%열선시트%' OR OPTIONS LIKE '%가죽시트%'
GROUP BY    CAR_TYPE
ORDER BY    CAR_TYPE;
```