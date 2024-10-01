# 10월 1주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** 프로그래머스
### 가장 비싼 상품 구하기

```sql
SELECT MAX(PRICE) AS MAX_PRICE
FROM PRODUCT;
```

### 가격이 제일 비싼 식품의 정보 출력하기

```sql
SELECT PRODUCT_ID, PRODUCT_NAME, PRODUCT_CD, CATEGORY, PRICE
FROM FOOD_PRODUCT
ORDER BY PRICE DESC
FETCH FIRST 1 ROWS ONLY;
```

### 최댓값 구하기

```sql
SELECT MAX(DATETIME)
FROM ANIMAL_INS;
```