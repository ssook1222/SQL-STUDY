# 8월 5주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** 프로그래머스


### 언어별 개발자 분류하기

```sql
WITH fe AS (
    SELECT BIT_OR(code) AS skill_code 
    FROM skillcodes 
    GROUP BY category 
    HAVING category = 'Front End'
), dev_grade AS (
    SELECT
        CASE
            WHEN dev.skill_code & fe.skill_code 
                AND dev.skill_code & (SELECT code FROM skillcodes WHERE name = 'Python')
                THEN 'A'
            WHEN dev.skill_code & (SELECT code FROM skillcodes WHERE name = 'C#') 
                THEN 'B'
            WHEN dev.skill_code & fe.skill_code 
                THEN 'C'
            ELSE NULL
        END AS grade
        , id
        , email
    FROM
        developers dev
        , fe
)

SELECT
    grade
    , id
    , email
FROM
    dev_grade
WHERE
    grade IS NOT NULL
ORDER BY
    grade, id;

```

### 연간 평가점수에 해당하는 평가 등급 및 성과금 조회하기

```sql
SELECT e.emp_no, e.emp_name,
        CASE WHEN AVG(score) >= 96 THEN 'S'
            WHEN AVG(score) >= 90 THEN 'A'
            WHEN AVG(score) >= 80 THEN 'B'
            ELSE 'C'
        END AS grade,
        CASE WHEN AVG(score) >= 96 THEN e.sal * 0.2
            WHEN AVG(score) >= 90 THEN e.sal * 0.15
            WHEN AVG(score) >= 80 THEN e.sal * 0.1
            ELSE 0
        END AS bonus
FROM hr_employees AS e
LEFT JOIN hr_grade ON e.emp_no = hr_grade.emp_no
GROUP BY e.emp_no, e.emp_name, e.sal
ORDER BY e.emp_no ASC;

```

### 자동차 대여 기록 별 대여 금액 구하기

```sql
WITH VALUE AS (
    SELECT CAR.DAILY_FEE, CAR.CAR_TYPE, HIS.HISTORY_ID,
           DATEDIFF(HIS.END_DATE, HIS.START_DATE) + 1 AS PERIOD,
           CASE 
               WHEN DATEDIFF(HIS.END_DATE, HIS.START_DATE) + 1 >= 90 THEN '90일 이상'
               WHEN DATEDIFF(HIS.END_DATE, HIS.START_DATE) + 1 >= 30 THEN '30일 이상'
               WHEN DATEDIFF(HIS.END_DATE, HIS.START_DATE) + 1 >= 7 THEN '7일 이상'
               ELSE 'NONE'
           END AS DURATION_TYPE
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY AS HIS
    INNER JOIN CAR_RENTAL_COMPANY_CAR AS CAR ON CAR.CAR_ID = HIS.CAR_ID
    WHERE CAR.CAR_TYPE = '트럭'
)

SELECT VALUE.HISTORY_ID, 
       ROUND(VALUE.DAILY_FEE * VALUE.PERIOD * 
             (100 - IFNULL(PLAN.DISCOUNT_RATE, 0)) / 100) AS FEE
FROM VALUE
LEFT JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN AS PLAN 
    ON PLAN.DURATION_TYPE = VALUE.DURATION_TYPE 
    AND PLAN.CAR_TYPE = VALUE.CAR_TYPE
ORDER BY FEE DESC, VALUE.HISTORY_ID DESC;

```