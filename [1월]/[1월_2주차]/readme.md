## 1월 2주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 **왜** 그렇게 작성했는지 생각해보기

`문제 플랫폼`     
프로그래머스, Do it! Oracle 데이터베이스 입문

`문제 풀이에 참여한 날짜`
- [1월 11일](#1월-11일)
- [1월 13일](#1월-13일)

---

### 1월 11일

### 1. 식품분류별 가장 비싼 식품의 정보 조회하기

```sql
WITH A AS
(
    SELECT CATEGORY 
           , MAX(PRICE) AS PRICE
    FROM FOOD_PRODUCT
    GROUP BY CATEGORY 
    HAVING CATEGORY IN ('과자','국','김치','식용유')
)
SELECT A.CATEGORY, A.PRICE AS MAX_PRICE, B.PRODUCT_NAME
FROM A INNER JOIN FOOD_PRODUCT B 
     ON A.CATEGORY=B.CATEGORY
    AND A.PRICE = B.PRICE
ORDER BY MAX_PRICE DESC
```

---

### 2. 취소되지 않은 예약 조회하기

```sql
SELECT A.APNT_NO
        , P.PT_NAME
        , P.PT_NO
        , D.MCDP_CD
        , D.DR_NAME
        , A.APNT_YMD
FROM APPOINTMENT A INNER JOIN DOCTOR D ON A.MDDR_ID = D.DR_ID 
     INNER JOIN PATIENT P ON A.PT_NO = P.PT_NO
WHERE A.APNT_CNCL_YN = 'N' AND D.MCDP_CD = 'CS'
AND TO_CHAR(APNT_YMD,'YYYY-MM-DD') LIKE '2022-04-13%'
ORDER BY A.APNT_YMD
```

→ 진짜 최악의 문제. 추천하지 않음

---

### 3. 헤비 유저가 보유한 장소

```sql
WITH HEAVY_USER AS
(
SELECT HOST_ID
FROM PLACES
GROUP BY HOST_ID
HAVING COUNT(ID) > 1
)

SELECT ID, NAME, A.HOST_ID
FROM PLACES A, HEAVY_USER 
WHERE A.HOST_ID = HEAVY_USER.HOST_ID
ORDER BY ID ASC
```

---

### 1월 13일

### 1.

```sql
SELECT DEPTNO
       , TRUNC(AVG(SAL),0) AS AVG_SAL
       , MAX(SAL) AS MAX_SAL
       , MIN(SAL) AS MIN_SAL
       , COUNT(*)AS CNT 
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO DESC
```

- 무난한 Group by 문제,    
  쿼리 짜다보면 종종 Group by에 집계함수 외에 다른 칼럼들을 넣고 Group By에 안 넣어서 에러를 많이 띄우는 데 유념해두자.

### 2.

```sql
SELECT JOB
       , COUNT(*)
FROM EMP
GROUP BY JOB
HAVING COUNT(*) >= 3
```

- 간단한 Having 절 문제,   
Having 절은 Where절과 다르게 Group By 절로 되어 있는 부분만을 조건으로 걸 수 있다.


### 3.

```sql
SELECT TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR,
       DEPTNO,
       COUNT(*) AS CNT
  FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO;
```

- TO_CHAR로 풀었는데, EXTRACT로도 접근할 수 있었던 문재.
- GROUP BY는 실행순서 보면 알 수 있듯, 지정한 별칭을 사용할 수 없다.

### [Keep] 4.

```sql
SELECT CASE WHEN COMM IS NULL THEN 'X'
            WHEN COMM IS NOT NULL THEN 'O' 
            END AS EXIST_COMM
      , COUNT(*) AS CNT      
FROM EMP
GROUP BY CASE WHEN COMM IS NULL THEN 'X'
            WHEN COMM IS NOT NULL THEN 'O' 
            END
```

- CASE문 써서 쿼리가 길어졌음. NVL을 써도 되겠지만, 범용성 생각해서 CASE문으로 진행
- **다른 방식으로 쿼리를 짤 수 있는 지 찾아보기**

### 5.

```sql
SELECT DEPTNO
       , EXTRACT(YEAR FROM HIREDATE) AS HIRE_YEAR
       , COUNT(*)AS CNT
       , MAX(SAL) AS MAX_SAL
       , MIN(SAL) AS MIN_SAL
       , SUM(SAL) AS SUM_SAL
       , AVG(SAL) AS AVG_SAL
FROM EMP
GROUP BY ROLLUP(DEPTNO, EXTRACT(YEAR FROM HIREDATE))
```

- RollUp 사용하여 푼 문제.
- RollUp과 Cube의 차이점은 기억해두자.

> **RollUp과 Cube 차이점**
> 
> RollUp
> - 소그룹 간의 합계를 계산하는 함수
> - **각각의 소그룹 합계와 전체 합계를 모두 구할 수 있음**
> 
> Cube
> - **Group By**에 명시한 모든 컬럼에 대해 소그룹 합계를 계산
