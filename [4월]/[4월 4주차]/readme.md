# 4월 4주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

`문제 플랫폼`    
프로그래머스

`문제 풀이에 참여한 날짜`    
- [4월 24일](#4월-24일)
- [4월 25일](#4월-25일)
- [4월 27일](#4월-27일)

## 4월 24일

### DATETIME에서 DATE로 형 변환

```sql
SELECT  ANIMAL_ID,
        NAME,
        TO_CHAR(DATETIME, 'YYYY-MM-DD') AS "날짜"
FROM    ANIMAL_INS
ORDER BY    ANIMAL_ID
```

### 진료과별 총 예약 횟수 구하기

```sql
SELECT      MCDP_CD AS "진료과 코드"
            , COUNT(*) AS "5월예약건수"
FROM        APPOINTMENT
WHERE       TO_CHAR(APNT_YMD, 'YYYY-MM-DD') LIKE '2022-05%'
GROUP BY    MCDP_CD
ORDER BY    COUNT(*), MCDP_CD
```

### 입양 시각 구하기

```sql
WITH TIME AS(
SELECT  TO_CHAR(datetime,'fmHH24') AS HOUR
        , COUNT(*) AS COUNT
FROM    ANIMAL_OUTS
GROUP BY    TO_CHAR(datetime,'fmHH24')

UNION ALL

SELECT  TO_CHAR(LEVEL - 1) AS HOUR
        , COUNT(*)-1 AS COUNT
FROM    DUAL
CONNECT BY LEVEL < 25
GROUP BY LEVEL - 1
)
SELECT      TO_NUMBER(HOUR) AS HOUR
            , SUM(COUNT) AS COUNT
FROM        TIME
GROUP BY    HOUR
ORDER BY    HOUR
```

## 4월 25일

### 조건에 맞는 도서와 저자 리스트 출력하기

```sql
SELECT  B.BOOK_ID,
        A.AUTHOR_NAME,
        TO_CHAR(B.PUBLISHED_DATE, 'YYYY-MM-DD') AS PUBLISHED_DATE
FROM    BOOK B INNER JOIN AUTHOR A ON B.AUTHOR_ID = A.AUTHOR_ID
WHERE   B.CATEGORY = '경제'
ORDER BY    B.PUBLISHED_DATE
```

### 년, 월, 성별 별 상품 구매 회원 수 구하기

```sql
WITH A AS (
    SELECT      EXTRACT(YEAR FROM SALES_DATE) AS YEAR, 
                EXTRACT(MONTH FROM SALES_DATE) AS MONTH,
                USER_ID
    FROM        ONLINE_SALE
)

SELECT          YEAR,
                MONTH,
                GENDER,
                COUNT(DISTINCT A.USER_ID) AS USERS
                
FROM            A INNER JOIN USER_INFO B ON A.USER_ID = B.USER_ID
WHERE           B.GENDER IS NOT NULL
GROUP BY        YEAR, MONTH, GENDER
ORDER BY        YEAR, MONTH, GENDER
```

### 루시와 엘라 찾기

```sql
SELECT      ANIMAL_ID	
            , NAME
            , SEX_UPON_INTAKE
FROM        ANIMAL_INS
WHERE       NAME = 'Lucy' OR NAME = 'Ella' OR NAME = 'Pickle' OR NAME = 'Rogan' OR NAME = 'Sabrina' OR NAME = 'Mitty'
ORDER BY    ANIMAL_ID ASC
SELECT      SUBSTR(PRODUCT_CODE,1,2) AS CATEGORY
            , COUNT(*) AS PRODUCTS
FROM        PRODUCT
GROUP BY    SUBSTR(PRODUCT_CODE,1,2) 
ORDER BY    SUBSTR(PRODUCT_CODE,1,2)
```

## 4월 27일

### 자동차 종류 별 특정 옵션이 포함된 자동차 수 구하기

```sql
SELECT      CAR_TYPE
            , COUNT(*) AS CARS
FROM        CAR_RENTAL_COMPANY_CAR
WHERE       OPTIONS LIKE '%통풍시트%' OR OPTIONS LIKE '%열선시트%' OR OPTIONS LIKE '%가죽시트%'
GROUP BY    CAR_TYPE
ORDER BY    CAR_TYPE
```

### 중성화 여부 파악하기

```sql
SELECT  ANIMAL_ID	
        , NAME
        , CASE WHEN SEX_UPON_INTAKE LIKE '%Neutered%' THEN 'O'
               WHEN SEX_UPON_INTAKE LIKE '%Spayed%' THEN 'O' 
               ELSE 'X' END AS '중성화'
FROM    ANIMAL_INS
ORDER BY   ANIMAL_IDㅁ
```

### 카테고리 별 상품 개수 구하기

```sql
SELECT      SUBSTR(PRODUCT_CODE,1,2) AS CATEGORY
            , COUNT(*) AS PRODUCTS
FROM        PRODUCT
GROUP BY    SUBSTR(PRODUCT_CODE,1,2) 
ORDER BY    SUBSTR(PRODUCT_CODE,1,2)
```