## 3월 4주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 **왜** 그렇게 작성했는지 생각해보기

`문제 플랫폼`     
프로그래머스

`문제 풀이에 참여한 날짜`
- [3월 20일](#3월-20일)
- [3월 21일](#3월-21일)
- [3월 22일](#3월-22일)

## 3월 20일

### 가장 비싼 상품 구하기

```sql
SELECT  MAX(PRICE) AS MAX_PRICE
FROM    PRODUCT
```

### 조건에 맞는 사용자 정보 출력하기

```sql
WITH UB AS (
    SELECT WRITER_ID
    FROM USED_GOODS_BOARD
    GROUP BY WRITER_ID
    HAVING COUNT(*) >= 3
)

SELECT  USER_ID
        , NICKNAME
        , CONCAT(CONCAT(CONCAT(CONCAT(CITY, ' '), STREET_ADDRESS1),' '), STREET_ADDRESS2) AS 전체주소
        , SUBSTR(TLNO,1,3) || '-' || SUBSTR(TLNO,4,4) || '-' || SUBSTR(TLNO, 8) AS 전화번호

FROM    USED_GOODS_USER UG INNER JOIN UB
ON UG.USER_ID = UB.WRITER_ID
ORDER BY USER_ID DESC
```

### 중복 제거하기

```sql
SELECT  COUNT(DISTINCT NAME) AS COUNT
FROM    ANIMAL_INS
```

### 자동차 대여 기록에서 대여 중 / 대여 가능 여부 구분하기

```sql
WITH TEST AS(
SELECT  CAR_ID
FROM    CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE   TO_DATE('2022-10-16', 'YYYY-MM-DD') BETWEEN START_DATE AND END_DATE
)    
SELECT  DISTINCT C.CAR_ID,
        CASE WHEN TEST.CAR_ID IS NULL THEN '대여 가능'
             WHEN TEST.CAR_ID IS NOT NULL THEN '대여중'
             END AS AVAILABILITY
FROM    CAR_RENTAL_COMPANY_RENTAL_HISTORY C LEFT OUTER JOIN TEST 
        ON C.CAR_ID = TEST.CAR_ID

ORDER BY CAR_ID DESC
```

## 3월 21일

### 조건에 부합하는 중고 거래 댓글 조회하기

```sql
SELECT  UB.TITLE, 
        UB.BOARD_ID,
        UR.REPLY_ID,
        UR.WRITER_ID,
        UR.CONTENTS,
        TO_CHAR(UR.CREATED_DATE, 'YYYY-MM-DD') AS CREATED_DATE

FROM    USED_GOODS_BOARD UB INNER JOIN
        USED_GOODS_REPLY UR
        ON UB.BOARD_ID = UR.BOARD_ID

WHERE   EXTRACT(MONTH FROM UB.CREATED_DATE) = 10
        AND
        EXTRACT(YEAR FROM UB.CREATED_DATE) = 2022

ORDER BY    UR.CREATED_DATE, UB.TITLE
```

### 나이 정보가 없는 회원 수 구하기

```sql
SELECT  COUNT(*) AS USERS
FROM    USER_INFO
WHERE   AGE IS NULL
```

### 경기도에 위치한 식품창고 목록 출력하기

```sql
SELECT  WAREHOUSE_ID,
        WAREHOUSE_NAME,
        ADDRESS,
        CASE WHEN FREEZER_YN IS NULL THEN 'N'
             WHEN FREEZER_YN IS NOT NULL THEN FREEZER_YN
             END AS FREEZER_YN
             
FROM    FOOD_WAREHOUSE
WHERE   ADDRESS LIKE '경기도%'
ORDER BY    WAREHOUSE_ID
```

### 최솟값 구하기

```sql
SELECT  MIN(DATETIME) AS 시간
FROM    ANIMAL_INS
```

---


## 3월 22일

### 조회수가 가장 많은 중고 거래 게시판의 첨부 파일 조회하기

```sql
SELECT      '/home/grep/src/'|| UB.BOARD_ID || '/' || FILE_ID || FILE_NAME || FILE_EXT AS FILE_PATH
FROM        USED_GOODS_FILE UF INNER JOIN USED_GOODS_BOARD UB 
ON          UF.BOARD_ID = UB.BOARD_ID
WHERE       VIEWS IN (
    SELECT  MAX(VIEWS)
    FROM    USED_GOODS_BOARD
)
ORDER BY    FILE_ID DESC
```

### 동명 동물 수 찾기

```sql
SELECT      NAME,
            COUNT(NAME) AS COUNT
FROM        ANIMAL_INS
GROUP BY    NAME
HAVING      COUNT(NAME) >= 2
ORDER BY    NAME
```

### 동물 수 구하기

```sql
SELECT  COUNT(*) AS COUNT
FROM    ANIMAL_INS
```

### 이름에 el이 들어가는 동물 찾기

```sql
SELECT  ANIMAL_ID,
        NAME
FROM    ANIMAL_INS
WHERE   LOWER(NAME) LIKE '%el%' 
        AND ANIMAL_TYPE = 'Dog'
ORDER BY    NAME
```