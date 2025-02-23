# 2월 1주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

### 오랜 기간 보호한 동물(2)

```sql
WITH C AS (
    SELECT 
        B.ANIMAL_ID,
        B.NAME,
        B.DATETIME,
        TIMESTAMPDIFF(SECOND, A.DATETIME, B.DATETIME) AS TIME_DIFF
    FROM ANIMAL_INS A
    JOIN ANIMAL_OUTS B ON A.ANIMAL_ID = B.ANIMAL_ID
    ORDER BY TIME_DIFF DESC
)
SELECT ANIMAL_ID, NAME
FROM C
LIMIT 2;
```

### 자동차 대여 기록 별 대여 금액 구하기

```sql
 WITH VALUE AS (
    SELECT CAR.DAILY_FEE, CAR.CAR_TYPE, HIS.HISTORY_ID,
           TRUNC(HIS.END_DATE - HIS.START_DATE) + 1 AS PERIOD,
           CASE 
               WHEN TRUNC(HIS.END_DATE - HIS.START_DATE) + 1 >= 90 THEN '90일 이상'
               WHEN TRUNC(HIS.END_DATE - HIS.START_DATE) + 1 >= 30 THEN '30일 이상'
               WHEN TRUNC(HIS.END_DATE - HIS.START_DATE) + 1 >= 7 THEN '7일 이상'
               ELSE 'NONE'
           END AS DURATION_TYPE
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY HIS
    INNER JOIN CAR_RENTAL_COMPANY_CAR CAR ON CAR.CAR_ID = HIS.CAR_ID
    WHERE CAR.CAR_TYPE = '트럭'
)

SELECT VALUE.HISTORY_ID, 
       ROUND(VALUE.DAILY_FEE * VALUE.PERIOD * 
             (100 - NVL(PLAN.DISCOUNT_RATE, 0)) / 100) AS FEE
FROM VALUE
LEFT JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN PLAN 
    ON PLAN.DURATION_TYPE = VALUE.DURATION_TYPE 
    AND PLAN.CAR_TYPE = VALUE.CAR_TYPE
ORDER BY FEE DESC, VALUE.HISTORY_ID DESC;

```

### 조건별로 분류하여 주문상태 출력하기

```sql
SELECT  ORDER_ID,	
        PRODUCT_ID,	
        DATE_FORMAT(OUT_DATE, '%Y-%m-%d') AS OUT_DATE,
        CASE 
            WHEN OUT_DATE > '2022-05-01' THEN '출고대기'
            WHEN OUT_DATE <= '2022-05-01' THEN '출고완료'
            ELSE '출고미정'
        END AS 출고여부
FROM FOOD_ORDER  
ORDER BY ORDER_ID ASC;

```