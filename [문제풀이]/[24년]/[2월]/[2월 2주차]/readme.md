# 2월 2주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** sqlbolt

---

## **SQL Lesson 13: Inserting rows**

### Add the studio's new production, **Toy Story 4** to the list of movies (you can use any director)

```sql
INSERT INTO MOVIES
(Id, Title,	Director, Year, Length_minutes)
VALUES (11, 'Toy Story 4', 'John Lasseter', 2014, 100);
```

### Toy Story 4 has been released to critical acclaim! It had a rating of **8.7**, and made **340 million domestically** and **270 million internationally**. Add the record to the **`BoxOffice`** table.

```sql
INSERT INTO boxoffice
(movie_id, rating, Domestic_sales, International_sales)
VALUES (11, 8.7, 340000000, 2700000000);
```

---

## **SQL Lesson 14: Updating rows**

### The director for A Bug's Life is incorrect, it was actually directed by **John Lasseter**

```sql
UPDATE Movies
SET Director = 'John Lasseter'
WHERE Id = 2;
```