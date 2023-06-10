# 5월 3주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

`문제 플랫폼`    
프로그래머스, 리트코드

`문제 풀이에 참여한 날짜`    
- [5월 19일](#5월-19일)

### 5월 19일

### 자동차 평균 대여 기간 구하기

```sql
SELECT      CAR_ID
            , ROUND(AVG(TO_DATE(END_DATE) - TO_DATE(START_DATE) + 1),1) AS AVERAGE_DURATION
FROM        CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY    CAR_ID
HAVING      ROUND(AVG(TO_DATE(END_DATE) - TO_DATE(START_DATE) + 1),1) >= 7
ORDER BY    ROUND(AVG(TO_DATE(END_DATE) - TO_DATE(START_DATE) + 1),1) DESC, CAR_ID DESC
```

### 성분으로 구분한 아이스크림 총 주문량

```sql
WITH A AS (
    SELECT      B.FLAVOR
                , INGREDIENT_TYPE
                , TOTAL_ORDER
    FROM        FIRST_HALF B INNER JOIN ICECREAM_INFO C 
    ON          B.FLAVOR = C.FLAVOR
)

SELECT      INGREDIENT_TYPE
            , SUM(TOTAL_ORDER) AS TOTAL_ORDER
FROM        A
GROUP BY    INGREDIENT_TYPE
```

### 175. Combine Two tables

```sql
SELECT  FIRSTNAME
        , LASTNAME
        , CITY
        , STATE

FROM PERSON A LEFT OUTER JOIN ADDRESS B ON A.PERSONID = B.PERSONID
```
