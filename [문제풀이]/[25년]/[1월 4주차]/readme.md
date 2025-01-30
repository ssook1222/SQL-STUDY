# 1월 4주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

### 대여 기록이 존재하는 자동차 리스트 구하기

```sql
SELECT A.CAR_ID
FROM CAR_RENTAL_COMPANY_CAR A
INNER JOIN (
    SELECT CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE MONTH(START_DATE) = 10
) B ON A.CAR_ID = B.CAR_ID
WHERE A.CAR_TYPE = '세단'
GROUP BY A.CAR_ID
ORDER BY A.CAR_ID DESC;
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
FROM    FOOD_ORDER  
ORDER BY ORDER_ID ASC;
```

### 취소되지 않은 진료 예약 조회하기

```sql
SELECT A.APNT_NO,  
       P.PT_NAME,  
       P.PT_NO,  
       D.MCDP_CD,  
       D.DR_NAME,  
       A.APNT_YMD  
FROM APPOINTMENT A  
INNER JOIN DOCTOR D ON A.MDDR_ID = D.DR_ID  
INNER JOIN PATIENT P ON A.PT_NO = P.PT_NO  
WHERE A.APNT_CNCL_YN = 'N'  
AND D.MCDP_CD = 'CS'  
AND DATE(A.APNT_YMD) = '2022-04-13'  
ORDER BY A.APNT_YMD;

```