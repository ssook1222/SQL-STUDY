# 9월 1주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** 프로그래머스

### **경기도에 위치한 식품창고 목록 출력하기**

```sql
SELECT 
    WAREHOUSE_ID,
    WAREHOUSE_NAME,
    ADDRESS,
    COALESCE(FREEZER_YN, 'N') AS FREEZER_YN
FROM 
    FOOD_WAREHOUSE
WHERE 
    ADDRESS LIKE '경기도%'
ORDER BY 
    WAREHOUSE_ID;
```

### 이름이 없는 동물의 아이디

```sql
SELECT 
    ANIMAL_ID
FROM 
    ANIMAL_INS
WHERE 
    NAME IS NULL
ORDER BY 
    ANIMAL_ID;

```

### 이름이 있는 동물의 아이디

```sql
SELECT 
    ANIMAL_ID
FROM 
    ANIMAL_INS
WHERE 
    NAME IS NOT NULL
ORDER BY 
    ANIMAL_ID;
```