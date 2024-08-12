# 8월 3주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** Leetcode, 프로그래머스


### 262. trips and users

```sql
Select t.Request_at as Day
				, round(sum(case when t.Status != 'completed' then 1 else 0 end)/count(*),2) as 'Cancellation Rate'
From Trips t
Where t.Client_Id in (select Users_Id from Users where Banned ='No')
and t.Driver_Id in (select Users_Id from Users where Banned = 'No')
and t.Request_at between '2013-10-01' and '2013-10-03'
Group by t.Request_at;
```

### 1158. Market Analysis I

```sql
SELECT  u.user_id AS buyer_id,
        u.join_date,
        COUNT(order_id) AS orders_in_2019
FROM    Users AS u LEFT JOIN Orders AS o ON u.user_id = o.buyer_id AND YEAR(order_date) = 2019
GROUP BY user_id;
```

### 업그레이드 할 수 없는 아이템 구하기

```sql
SELECT I.ITEM_ID
				, I.ITEM_NAME
				, I.RARITY
FROM ITEM_INFO as I
LEFT OUTER JOIN ITEM_TREE as T
    on I.ITEM_ID = T.PARENT_ITEM_ID
WHERE T.PARENT_ITEM_ID is NULL
ORDER BY I.ITEM_ID DESC;
```