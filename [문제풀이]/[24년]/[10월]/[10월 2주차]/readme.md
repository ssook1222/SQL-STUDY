# 10월 2주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** 프로그래머스

### 최솟값 구하기

```sql
SELECT MIN(DATETIME) AS 시간
FROM ANIMAL_INS;
```

### 동물 수 구하기

```sql
SELECT COUNT(*) AS COUNT
FROM ANIMAL_INS;
```

### 중복 제거하기

```sql
SELECT COUNT(DISTINCT NAME) AS COUNT
FROM ANIMAL_INS;
```