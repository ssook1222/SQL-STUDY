# 2월 2주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

### 강원도에 위치한 생산공장 목록 출력하기

```sql
SELECT FACTORY_ID, FACTORY_NAME, ADDRESS
FROM FOOD_FACTORY
WHERE ADDRESS LIKE '강원도%'
ORDER BY FACTORY_ID ASC;
```

### 나이 정보가 없는 회원 수 구하기

```sql
SELECT COUNT(*) AS USERS
FROM USER_INFO
WHERE AGE IS NULL;
```

### 12세 이하인 여자 환자 목록 출력하기

```sql
SELECT PT_NAME, PT_NO, GEND_CD, AGE, 
       IFNULL(TLNO, 'NONE') AS TLNO
FROM PATIENT
WHERE AGE <= 12 
  AND GEND_CD = 'W'
ORDER BY AGE DESC, PT_NAME ASC;
```