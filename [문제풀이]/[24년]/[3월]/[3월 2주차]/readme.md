# 3월 2주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** programmers

---

### 연도 별 평균 미세먼지 농도 조회하기

```sql
SELECT      YEAR(YM) AS YEAR
            , ROUND(AVG(PM_VAL1), 2) AS 'PM10'
            , ROUND(AVG(PM_VAL2), 2) AS 'PM2.5'
FROM        AIR_POLLUTION
WHERE       LOCATION2 = '수원'
GROUP BY    YEAR(YM)
ORDER BY    YEAR(YM) ASC
```

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

### 조건에 맞는 개발자 찾기

```sql
SELECT  ID
        , EMAIL
        , FIRST_NAME
        , LAST_NAME
FROM DEVELOPERS
WHERE (
        SKILL_CODE & 
        (SELECT     CODE 
         FROM       SKILLCODES 
         WHERE      NAME = 'Python') > 0
        OR 
        SKILL_CODE & 
        (SELECT     CODE 
         FROM       SKILLCODES 
         WHERE      NAME = 'C#') > 0
      )
ORDER BY ID ASC;

```