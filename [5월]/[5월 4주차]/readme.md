# 5월 4주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

`문제 플랫폼`    
LeetCode

`문제 풀이에 참여한 날짜`    
- [5월 21일](#5월-21일)

### 5월 21일

## 511. Game Play Analysis I

```sql
SELECT  PLAYER_ID
        , TO_CHAR(EVENT_DATE, 'YYYY-MM-DD') AS FIRST_LOGIN

FROM    ACTIVITY A
WHERE   EVENT_DATE = (
    SELECT  MIN(EVENT_DATE)
    FROM    ACTIVITY B
    WHERE   B.PLAYER_ID = A.PLAYER_ID
)
```

### **1757. Recyclable and Low Fat Products**

```sql
SELECT  PRODUCT_ID
FROM    PRODUCTS
WHERE   LOW_FATS = 'Y' AND RECYCLABLE = 'Y'
```

### **1378. Replace Employee ID With The Unique Identifier**

```sql
SELECT  UNIQUE_ID
        , NAME

FROM    Employees A LEFT OUTER JOIN EmployeeUNI B
ON      A.ID = B.ID
ORDER BY    NAME
```