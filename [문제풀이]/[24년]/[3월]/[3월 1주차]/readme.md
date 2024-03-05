# 3월 1주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** programmers

---

### 조건에 맞는 사원 정보 조회하기

```sql
WITH A AS (
    SELECT      SUM(SCORE) AS SCORE
            , E.EMP_NO 
    FROM        HR_EMPLOYEES E INNER JOIN HR_DEPARTMENT D ON D.DEPT_ID = E.DEPT_ID
            INNER JOIN HR_GRADE G ON E.EMP_NO = G.EMP_NO
    GROUP BY    E.EMP_NO
    ORDER BY    SCORE DESC
    LIMIT 1
)

SELECT  SCORE
        , A.EMP_NO
        , EMP_NAME
        , POSITION
        , EMAIL
FROM    A INNER JOIN HR_EMPLOYEES E ON A.EMP_NO = E.EMP_NO
```

---

### 노선 별 평균 역 사이 거리 조회하기

```sql
SELECT      ROUTE
            , CONCAT(ROUND(SUM(D_BETWEEN_DIST), 1), 'km') AS TOTAL_DISTANCE
            , CONCAT(ROUND(AVG(D_BETWEEN_DIST), 2), 'km') AS AVERAGE_DISTANCE
FROM        SUBWAY_DISTANCE
GROUP BY    ROUTE
ORDER BY    ROUND(SUM(D_BETWEEN_DIST), 2) DESC;
```

---

### FrontEnd 개발자 찾기

```sql
SELECT      DISTINCT D.ID,
            D.EMAIL,
            D.FIRST_NAME,
            D.LAST_NAME
FROM        DEVELOPERS D INNER JOIN SKILLCODES S 
            ON (D.SKILL_CODE & S.CODE) = S.CODE
WHERE       S.CATEGORY = 'Front End'
ORDER BY    D.ID ASC;
```