## 2월 3주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 **왜** 그렇게 작성했는지 생각해보기

`문제 플랫폼`     
프로그래머스

`문제 풀이에 참여한 날짜`
- [2월 16일](#2월-16일)

## 2월 16일

### 특정 옵션이 포함된 자동차 리스트 구하기

```sql
SELECT  CAR_ID
        , CAR_TYPE	
        , DAILY_FEE
        , OPTIONS
FROM    CAR_RENTAL_COMPANY_CAR
WHERE   OPTIONS LIKE '%네비게이션%'
ORDER BY    CAR_ID DESC
```

- `LIKE` 써서 풀었지만, `CONTAINS`도 사용가능함.
    
    아래는 CONTAINS 관련 오라클 공식 문서 링크
    
    [링크보러 이동하기](https://docs.oracle.com/database/121/CCAPP/GUID-5BE34ED3-4B35-412A-BD53-E3F663B9EB8C.htm)
    

### 조건별로 분류하여 주문상태 출력하기

```sql
SELECT  ORDER_ID	
        , PRODUCT_ID	
        , TO_CHAR(OUT_DATE, 'YYYY-MM-DD') AS OUT_DATE
        , CASE WHEN TO_CHAR(OUT_DATE, 'YYYY-MM-DD') > '2022-05-01' THEN '출고대기'
               WHEN TO_CHAR(OUT_DATE, 'YYYY-MM-DD') <= '2022-05-01' THEN '출고완료'
               ELSE '출고미정'
          END AS 출고여부
FROM    FOOD_ORDER  
ORDER BY    ORDER_ID ASC
```

### 흉부외과 또는 일반외과 의사 목록 출력하기

```sql
SELECT  DR_NAME 
        , DR_ID	
        , MCDP_CD	
        , TO_CHAR(HIRE_YMD, 'YYYY-MM-DD') AS HIRE_YMD
FROM     DOCTOR
WHERE   MCDP_CD = 'CS' OR MCDP_CD = 'GS'
ORDER BY    HIRE_YMD DESC, DR_NAME ASC
```

### 오랜기간 보호한 동물(2)

```sql
WITH C AS (
SELECT      B.ANIMAL_ID   
            , B.NAME
            , B.DATETIME
            , B.DATETIME - A.DATETIME

FROM         (
                SELECT      ANIMAL_ID
                            , NAME
                            , DATETIME
                FROM        ANIMAL_INS
             ) A
             , ANIMAL_OUTS B
WHERE       A.ANIMAL_ID = B.ANIMAL_ID
ORDER BY    B.DATETIME - A.DATETIME DESC
)

SELECT      ANIMAL_ID
            , NAME
FROM C
FETCH NEXT 2 ROWS ONLY
```

- 3중으로 중첩해서 쿼리를 썼기 때문에 성능명에서 좋은지는 아직도 잘 모르겠음.
- WITH문 안에서 WITH문 또 선언하면 에러난다…