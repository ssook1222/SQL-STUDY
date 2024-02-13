# 2월 3주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** sqlbolt

---

## **SQL Lesson 14: Updating rows**

### The year that Toy Story 2 was released is incorrect, it was actually released in **1999**

```sql
UPDATE MOVIES
SET Year = 1999
WHERE TITLE = 'Toy Story 2';
```

### Both the title and director for Toy Story 8 is incorrect! The title should be "Toy Story 3" and it was directed by **Lee Unkrich**

```sql
UPDATE MOVIES
SET Director = 'Lee Unkrich',
		Title = 'Toy Story 3'
WHERE ID = 11
```

---

## SQL Lesson 15: **Deleting rows**

### This database is getting too big, lets remove all movies that were released **before** 2005.

```sql
DELETE FROM mytable
WHERE condition;
```