# 2월 3주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

### 부서별 평균 연봉 조회하기

```sql
SELECT  E.DEPT_ID
        , DEPT_NAME_EN
        , ROUND(AVG(SAL), 0) AS AVG_SAL
FROM    HR_EMPLOYEES E INNER JOIN  HR_DEPARTMENT D 
        ON E.DEPT_ID = D.DEPT_ID
GROUP BY E.DEPT_ID
ORDER BY AVG(SAL) DESC
```

### 입양 시각 구하기(2)

```sql
WITH RECURSIVE hours AS (
    SELECT 0 AS hour
    UNION ALL
    SELECT hour + 1 FROM hours WHERE hour < 23
), 
time AS (
    SELECT HOUR(datetime) AS hour, COUNT(*) AS count
    FROM ANIMAL_OUTS
    GROUP BY HOUR(datetime)

    UNION ALL

    SELECT hour, 0 AS count
    FROM hours
)
SELECT hour, SUM(count) AS count
FROM time
GROUP BY hour
ORDER BY hour;

```

### 월별 잡은 물고기 수 구하기

```sql
SELECT      COUNT(*) AS FISH_COUNT
            , MONTH(TIME) AS MONTH
FROM        FISH_INFO
GROUP BY    MONTH(TIME)
ORDER BY    MONTH(TIME)
```