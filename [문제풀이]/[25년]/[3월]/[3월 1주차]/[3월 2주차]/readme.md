# 3월 1주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

### 조건에 맞는 도서와 저자 리스트 출력하기

```sql
SELECT B.BOOK_ID, 
       A.AUTHOR_NAME,
       DATE_FORMAT(B.PUBLISHED_DATE, '%Y-%m-%d') AS PUBLISHED_DATE
FROM BOOK B 
INNER JOIN AUTHOR A ON B.AUTHOR_ID = A.AUTHOR_ID
WHERE B.CATEGORY = '경제'
ORDER BY B.PUBLISHED_DATE;
```

### 그룹별 조건에 맞는 식당 목록 출력하기

```sql
SELECT 
    member_profile.member_name, 
    review_text, 
    TO_CHAR(review_date, 'YYYY-MM-DD') AS review_date
FROM 
    rest_review 
JOIN 
    member_profile 
ON 
    member_profile.member_id = rest_review.member_id
WHERE 
    rest_review.member_id = (
        SELECT member_id
        FROM (
            SELECT member_id, COUNT(*) AS review_count
            FROM rest_review
            GROUP BY member_id
            ORDER BY COUNT(*) DESC
        ) 
        WHERE ROWNUM = 1
    )
ORDER BY 
    review_date ASC;
```

### 없어진 기록 찾기

```sql
SELECT animal_outs.animal_id, 
       animal_outs.name
FROM animal_outs 
LEFT JOIN animal_ins ON animal_outs.animal_id = animal_ins.animal_id
WHERE animal_ins.animal_id IS NULL;
```