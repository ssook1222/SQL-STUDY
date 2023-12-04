# 7월 2주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

`문제 플랫폼`    
HackerRank, LeetCode

## 7월 13일

### 1667. Fix Names in a Table

```sql
SELECT      USER_ID
            , INITCAP(NAME) AS NAME
FROM        USERS
ORDER BY    USER_ID
```

오라클에는 괄호 안 문자열의 각 단어를 첫 글자는 **대문자**로 나머지는 **소문자**로 변경하는 initcap 함수가 있음!

### 1280. Students and Examinations

```sql
SELECT      S.student_id
            , S.student_name
            , COALESCE(SUB.subject_name, E.subject_name) AS subject_name
            , COALESCE(COUNT(E.subject_name), 0) AS attended_exams
FROM        Students S
CROSS JOIN  Subjects SUB
LEFT JOIN   Examinations E ON S.student_id = E.student_id AND SUB.subject_name = E.subject_name
GROUP BY    S.student_id, S.student_name, COALESCE(SUB.subject_name, E.subject_name)
ORDER BY    S.student_id, COALESCE(SUB.subject_name, E.subject_name)
```

먼저, `CROSS JOIN Subjects SUB`구문은 `Students` 테이블과 `Subjects` 테이블을 조인합니다.     
`CROSS JOIN`은 두 테이블 간의 모든 가능한 조합을 생성하므로, `Students`테이블의 각 학생과 Subjects`테이블의 모든 과목의 조합을 생성합니다. 
이로써 모든 학생이 모든 과목을 포함한 결과 집합을 얻을 수 있습니다.  
그 다음, `LEFT JOIN Examinations E ON S.student_id = E.student_id AND SUB.subject_name = E.subject_name` 구문은 `Examinations` 테이블을 `Students`와 `Subjects` 테이블과 조인합니다. 

### The Report

```sql
SELECT IF(G.GRADE >= 8, S.NAME, 'NULL')
        , G.Grade
        , S.Marks
FROM STUDENTS AS S
INNER JOIN GRADES AS G
ON S.MARKS BETWEEN G.MIN_MARK AND G.MAX_MARK
ORDER BY    G.GRADE DESC
            , S.NAME
            , S.MARKS
;
```

---

## 7월 14일

### SQL Project Planning

```sql
SELECT  Start_Date
        , MIN(End_Date)
FROM 
    (SELECT Start_Date 
     FROM Projects 
     WHERE Start_Date NOT IN 
        (SELECT End_Date FROM Projects)
    ) a,
    (SELECT End_Date
     FROM Projects
     WHERE End_Date NOT IN 
     (SELECT Start_Date FROM Projects)
    ) b
WHERE Start_Date < End_Date
GROUP BY Start_Date
ORDER BY MIN(End_Date)-Start_Date, Start_Date
;
```

### Draw The Triangle 1

```sql
WITH numbers AS (
  SELECT LEVEL AS n 
    FROM DUAL 
    CONNECT BY LEVEL <= 20
)
SELECT RTRIM(LPAD('* ', 2 * (21 - n), '* ')) AS pattern
FROM numbers
ORDER BY n;
```

### Draw The Triangle 2

```sql
WITH numbers AS (
  SELECT LEVEL AS n 
    FROM DUAL 
    CONNECT BY LEVEL <= 20
)
SELECT RPAD('* ', 2 * n, '* ') AS pattern
FROM numbers
ORDER BY n;
```
