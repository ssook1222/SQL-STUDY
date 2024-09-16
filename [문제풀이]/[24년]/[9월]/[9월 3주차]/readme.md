# 9월 3주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** 프로그래머스

### 3월에 태어난 여성 회원 목록 출력하기

```sql
SELECT MEMBER_ID, MEMBER_NAME, GENDER, TO_CHAR(DATE_OF_BIRTH, 'YYYY-MM-DD') AS DATE_OF_BIRTH
FROM MEMBER_PROFILE
WHERE GENDER = 'W'
  AND TLNO IS NOT NULL
  AND TO_CHAR(DATE_OF_BIRTH, 'MM') = '03'
ORDER BY MEMBER_ID ASC;
```

### 서울에 위치한 식당 목록 출력하기

```sql
SELECT REST_INFO.REST_ID, REST_NAME, FOOD_TYPE, FAVORITES, ADDRESS, ROUND(AVG(REVIEW_SCORE), 2) AS SCORE
FROM REST_REVIEW
JOIN REST_INFO ON REST_REVIEW.REST_ID = REST_INFO.REST_ID
WHERE SUBSTR(ADDRESS, 1, 5) = '서울특별시' OR SUBSTR(ADDRESS, 1, 3) = '서울시'
GROUP BY REST_INFO.REST_ID, REST_NAME, FOOD_TYPE, FAVORITES, ADDRESS
ORDER BY SCORE DESC, FAVORITES DESC;
```

### 조건에 부합하는 중고거래 댓글 조회하기

```sql
SELECT  UB.TITLE, 
        UB.BOARD_ID,
        UR.REPLY_ID,
        UR.WRITER_ID,
        UR.CONTENTS,
        DATE_FORMAT(UR.CREATED_DATE, '%Y-%m-%d') AS CREATED_DATE

FROM    USED_GOODS_BOARD UB 
INNER JOIN USED_GOODS_REPLY UR
        ON UB.BOARD_ID = UR.BOARD_ID

WHERE   MONTH(UB.CREATED_DATE) = 10
        AND
        YEAR(UB.CREATED_DATE) = 2022

ORDER BY UR.CREATED_DATE, UB.TITLE;

```