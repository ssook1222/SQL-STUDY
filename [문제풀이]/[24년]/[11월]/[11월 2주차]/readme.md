# 11월 1주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** 프로그래머스

### 성분으로 구분한 아이스크림 총 주문량

```sql
SELECT      INGREDIENT_TYPE,
            SUM(TOTAL_ORDER) AS TOTAL_ORDER
FROM        (
                SELECT      B.FLAVOR,
                            INGREDIENT_TYPE,
                            TOTAL_ORDER
                FROM        FIRST_HALF B
                INNER JOIN  ICECREAM_INFO C 
                ON          B.FLAVOR = C.FLAVOR
            ) AS A
GROUP BY    INGREDIENT_TYPE;
```

### NULL 처리하기

```sql
SELECT      ANIMAL_TYPE,
            CASE 
                WHEN NAME IS NULL THEN 'No name'
                ELSE NAME
            END AS NAME,
            SEX_UPON_INTAKE        
FROM        ANIMAL_INS
ORDER BY    ANIMAL_ID;
```

### 나이 정보가 없는 회원 수 구하기

```sql
SELECT  COUNT(*) AS USERS
FROM    USER_INFO
WHERE   AGE IS NULL;
```