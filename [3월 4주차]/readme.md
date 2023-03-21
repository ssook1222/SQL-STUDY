## 3월 4주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 **왜** 그렇게 작성했는지 생각해보기

`문제 플랫폼`     
프로그래머스

`문제 풀이에 참여한 날짜`
- [3월 20일](#3월-20일)

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