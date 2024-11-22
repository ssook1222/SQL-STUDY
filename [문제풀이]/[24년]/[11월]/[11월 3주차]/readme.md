# 11월 3주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** 프로그래머스


### 나이 정보가 없는 회원 수 구하기

```sql
SELECT COUNT(*) AS USERS
FROM USER_INFO
WHERE AGE IS NULL;
```

### 특정 옵션이 포함된 자동차 리스트 구하기

```sql
SELECT  CAR_ID,
        CAR_TYPE,
        DAILY_FEE,
        OPTIONS
FROM    CAR_RENTAL_COMPANY_CAR
WHERE   OPTIONS LIKE '%네비게이션%'
ORDER BY CAR_ID DESC;
```

### 자동차 대여 기록에서 장기/단기 대여 구분하기

```sql
SELECT  HISTORY_ID,
        CAR_ID,
        DATE_FORMAT(START_DATE, '%Y-%m-%d') AS START_DATE,
        DATE_FORMAT(END_DATE, '%Y-%m-%d') AS END_DATE,
        CASE 
            WHEN DATEDIFF(END_DATE, START_DATE) + 1 >= 30 THEN '장기 대여'
            WHEN DATEDIFF(END_DATE, START_DATE) + 1 < 30 THEN '단기 대여'
        END AS RENT_TYPE
FROM    CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE   MONTH(START_DATE) = 9
ORDER BY HISTORY_ID DESC;

```
