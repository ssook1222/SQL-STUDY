# 12월 1주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** 프로그래머스

### 자동차 평균 대여 기간 구하기

```sql
SELECT      CAR_ID,
            ROUND(AVG(DATEDIFF(END_DATE, START_DATE) + 1), 1) AS AVERAGE_DURATION
FROM        CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY    CAR_ID
HAVING      ROUND(AVG(DATEDIFF(END_DATE, START_DATE) + 1), 1) >= 7
ORDER BY    AVERAGE_DURATION DESC, CAR_ID DESC;
```

### 조회수가 가장 많은 중고거래 게시판의 첨부파일 조회하기

```sql
SELECT      CONCAT('/home/grep/src/', UB.BOARD_ID, '/', FILE_ID, FILE_NAME, FILE_EXT) AS FILE_PATH
FROM        USED_GOODS_FILE UF
INNER JOIN  USED_GOODS_BOARD UB 
ON          UF.BOARD_ID = UB.BOARD_ID
WHERE       VIEWS = (
    SELECT  MAX(VIEWS)
    FROM    USED_GOODS_BOARD
)
ORDER BY    FILE_ID DESC;

```

### 조건에 부합하는 중고거래 상태 조회하기

```sql
SELECT      BOARD_ID,
            WRITER_ID,
            TITLE,
            PRICE,
            CASE 
                WHEN STATUS = 'SALE' THEN '판매중'
                WHEN STATUS = 'RESERVED' THEN '예약중'
                WHEN STATUS = 'DONE' THEN '거래완료'
            END AS STATUS
FROM        USED_GOODS_BOARD
WHERE       DATE_FORMAT(CREATED_DATE, '%Y-%m-%d') = '2022-10-05'
ORDER BY    BOARD_ID DESC;
```