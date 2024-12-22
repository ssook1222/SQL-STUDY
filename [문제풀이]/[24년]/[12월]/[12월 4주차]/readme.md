# 12월 4주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** 프로그래머스
### 진료과별 총 예약 횟수 출력하기

```sql
SELECT      MCDP_CD AS `진료과 코드`,
            COUNT(*) AS `5월예약건수`
FROM        APPOINTMENT
WHERE       DATE_FORMAT(APNT_YMD, '%Y-%m') = '2022-05'
GROUP BY    MCDP_CD
ORDER BY    COUNT(*), MCDP_CD;

```

### 조건에 맞는 사용자와 총 거래금액 조회하기

```sql
SELECT  A.USER_ID,
        A.NICKNAME,
        SUM(B.PRICE) AS TOTAL_SALES
FROM    USED_GOODS_USER A
        INNER JOIN USED_GOODS_BOARD B
        ON B.WRITER_ID = A.USER_ID
WHERE   B.STATUS = 'DONE'
GROUP BY A.USER_ID, A.NICKNAME
HAVING   SUM(B.PRICE) >= 700000
ORDER BY TOTAL_SALES ASC;
```

### 즐겨찾기가 가장 많은 식당 정보 출력하기

```sql
WITH A AS (
    SELECT  FOOD_TYPE,
            MAX(FAVORITES) AS FAVORITES
    FROM    REST_INFO
    GROUP BY FOOD_TYPE
)
SELECT  B.FOOD_TYPE,
        B.REST_ID,
        B.REST_NAME,
        B.FAVORITES
FROM    A
        JOIN REST_INFO B
        ON A.FAVORITES = B.FAVORITES AND A.FOOD_TYPE = B.FOOD_TYPE
ORDER BY A.FOOD_TYPE DESC;

```