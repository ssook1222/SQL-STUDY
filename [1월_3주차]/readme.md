## 1월 3주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 **왜** 그렇게 작성했는지 생각해보기

`문제 플랫폼`     
프로그래머스

`문제 풀이에 참여한 날짜`
- [1월 15일](#1월-15일)

---

## 1월 15일

### 1. 대여 횟수가 많은 자동차들의 월별 대여 횟수 구하기

(2023-01-13)

```sql
WITH FILTER AS ( -- 8월 ~ 10월의 5개 이상인 자동차 아이디만 가져오는 거
    SELECT CAR_ID
       , COUNT(*) AS FILTER
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
		WHERE EXTRACT(MONTH FROM START_DATE) IN(8,9,10)
    GROUP BY CAR_ID
    HAVING COUNT(*) >= 5 
    ORDER BY CAR_ID DESC
)

SELECT EXTRACT(MONTH FROM START_DATE) AS MONTH
       , C.CAR_ID
       , COUNT(*) AS RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY C INNER JOIN FILTER F
ON C.CAR_ID = F.CAR_ID
GROUP BY EXTRACT(MONTH FROM START_DATE), C.CAR_ID
HAVING COUNT(*) > 0
ORDER BY MONTH ASC, CAR_ID DESC
```

(2023-01-15) `**정답**`

```sql
WITH FILTER AS ( -- 8~10월의 최소 1개 이상인 자동차 아이디만 가져오는 것
    SELECT CAR_ID
       , COUNT(*) AS FILTER
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE EXTRACT(MONTH FROM START_DATE) IN(8,9,10)
    GROUP BY CAR_ID
    ORDER BY CAR_ID DESC
)

SELECT EXTRACT(MONTH FROM START_DATE) AS MONTH
       , C.CAR_ID
       , COUNT(*) AS RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY C INNER JOIN FILTER F
ON  C.CAR_ID = F.CAR_ID 
WHERE   F.FILTER>=5 
        AND EXTRACT(MONTH FROM START_DATE) IN (8,9,10)
GROUP BY EXTRACT(MONTH FROM START_DATE), C.CAR_ID
ORDER BY MONTH ASC, CAR_ID DESC
```

- JOIN할 때 Having 절 조건 즉, 그룹화된 조건에서 데이터를 사전에 처리하고 가져와서 조인하면 사라지는 데이터가 있는 듯
    - 따라서 먼저 그룹화할 때 처리를 하지 말고 조인 이후에 Where 절로 나중에 처리해야 정답 처리 되고 있음.

### 2.  우유와 요거트가 담긴 장바구니

```sql
WITH MOB AS(
    SELECT cart_id, name
    FROM CART_PRODUCTS
    WHERE NAME = 'Milk'
)

SELECT C.CART_ID
FROM MOB, CART_PRODUCTS C
WHERE C.NAME = 'Yogurt' AND MOB.CART_ID = C.CART_ID 
GROUP BY C.CART_ID
ORDER BY CART_ID ASC
```

- 우유도 사고 요거트도 산 케이스만 뽑아내면 됨
- 굳이 With를 쓸 필요가 있었을까 싶긴 함…ㅋㅋㅋㅋ

### 3. 인기있는 아이스크림

```sql
SELECT FLAVOR
FROM FIRST_HALF
ORDER BY TOTAL_ORDER DESC, SHIPMENT_ID ASC
```

- group by와 다르게 SELECT절에 명시 안 한 칼럼이어도 `order by`에서는 사용 가능하다.

------



