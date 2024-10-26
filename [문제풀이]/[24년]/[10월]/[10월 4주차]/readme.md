# 10월 4주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** 프로그래머스

### 재구매가 일어난 상품과 회원 리스트 구하기

```sql
SELECT USER_ID
       , PRODUCT_ID
FROM   ONLINE_SALE
GROUP BY USER_ID, PRODUCT_ID
HAVING COUNT(*) > 1
ORDER BY USER_ID ASC, PRODUCT_ID DESC;
```

### 아픈 동물 찾기

```sql
SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
WHERE INTAKE_CONDITION = 'Sick'
ORDER BY ANIMAL_ID;
```

### 오프라인/온라인 판매 데이터 통합하기

```sql
SELECT DATE_FORMAT(SALES_DATE, '%Y-%m-%d') AS SALES_DATE
       , PRODUCT_ID
       , USER_ID
       , SALES_AMOUNT
FROM
    (SELECT A.SALES_DATE
           , A.PRODUCT_ID
           , A.USER_ID
           , A.SALES_AMOUNT
    FROM ONLINE_SALE A
    UNION ALL
    SELECT B.SALES_DATE
           , B.PRODUCT_ID
           , NULL AS USER_ID
           , B.SALES_AMOUNT
    FROM OFFLINE_SALE B) C
WHERE DATE_FORMAT(SALES_DATE, '%Y-%m-%d') LIKE '2022-03%'
ORDER BY SALES_DATE ASC, 
         PRODUCT_ID ASC,
         USER_ID ASC;

```