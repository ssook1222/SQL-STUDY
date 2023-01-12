## 1월 2주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 **왜** 그렇게 작성했는지 생각해보기

`문제 플랫폼`     
프로그래머스

`문제 풀이에 참여한 날짜`
- [1월 11일](#1월-11일)


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