# 12월 2주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** 프로그래머스

### 조건에 부합하는 중고거래 상태 조회하기

```sql
SELECT 
    BOARD_ID, 
    WRITER_ID, 
    TITLE, 
    PRICE, 
    CASE 
        WHEN STATUS = 'SALE' THEN '판매중'
        WHEN STATUS = 'RESERVED' THEN '예약중'
        WHEN STATUS = 'DONE' THEN '거래완료' 
    END AS STATUS
FROM USED_GOODS_BOARD
WHERE DATE_FORMAT(CREATED_DATE, '%Y-%m-%d') = '2022-10-05'
ORDER BY BOARD_ID DESC;

```

### 조건에 맞는 사용자 정보 조회하기

```sql
WITH UB AS (
    SELECT WRITER_ID
    FROM USED_GOODS_BOARD
    GROUP BY WRITER_ID
    HAVING COUNT(*) >= 3
)

SELECT  
    USER_ID, 
    NICKNAME, 
    CONCAT(CITY, ' ', STREET_ADDRESS1, ' ', STREET_ADDRESS2) AS 전체주소, 
    CONCAT(SUBSTR(TLNO, 1, 3), '-', SUBSTR(TLNO, 4, 4), '-', SUBSTR(TLNO, 8)) AS 전화번호

FROM USED_GOODS_USER UG 
INNER JOIN UB ON UG.USER_ID = UB.WRITER_ID
ORDER BY USER_ID DESC;

```

### 루시와 엘라 찾기

```sql
SELECT  
    ANIMAL_ID, 
    NAME, 
    SEX_UPON_INTAKE
FROM 
    ANIMAL_INS
WHERE 
    NAME IN ('Lucy', 'Ella', 'Pickle', 'Rogan', 'Sabrina', 'Mitty')
ORDER BY 
    ANIMAL_ID ASC;

```