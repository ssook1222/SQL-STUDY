# 3월 4주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** programmers

---
### 잔챙이 잡은 수 구하기

```sql
SELECT      COUNT(*) AS FISH_COUNT
FROM        FISH_INFO
WHERE       LENGTH IS NULL
```

### **가장 큰 물고기 10마리 구하기**

```sql
SELECT      ID
            , LENGTH
FROM        FISH_INFO
ORDER BY    LENGTH DESC, ID ASC
LIMIT 10
```

### 특정 물고기를 잡은 총 수 구하기

```sql
SELECT      COUNT(*) AS FISH_COUNT
FROM        FISH_INFO I INNER JOIN FISH_NAME_INFO N ON I.FISH_TYPE = N.FISH_TYPE
WHERE       N.FISH_NAME = 'BASS' OR N.FISH_NAME = 'SNAPPER'
```