# 10월 4주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

`문제 플랫폼`    
 SQLZOO

## Self join

### 1. How many **stops** are in the database.

```sql
SELECT count(*)
FROM stops
```

### 2. Find the **id** value for the stop 'Craiglockhart'

```sql
SELECT id
FROM stops
WHERE name = 'Craiglockhart'
```

### 3. Give the **id** and the **name** for the **stops** on the '4' 'LRT' service.

```sql
SELECT id, name
FROM stops INNER JOIN route ON stops.id = route.stop
WHERE route.num = '4' and route.company = 'LRT'
```

### 4. Add a HAVING clause to restrict the output to these two routes.

```sql
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2
```

### 5. Change the query so that it shows the services from Craiglockhart to London Road.

```sql
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 and b.stop=149
```

### 6. If you are tired of these places try 'Fairmilehead' against 'Tollcross’

```sql
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' and stopb.name='London Road'
```

### 7. Give a list of all the services which connect stops 115 and 137

```sql
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=115 and b.stop=137
```

### 8. Give a list of the services which connect the **stops** 'Craiglockhart' and 'Tollcross'

```sql
SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' and stopb.name='Tollcross'
```

### 9. Include the company and bus no. of the relevant services.

```sql
SELECT stopa.name, a.company, a.num
FROM route a
LEFT JOIN route b ON (a.num=b.num AND a.company=b.company)
LEFT JOIN stops stopa ON (a.stop=stopa.id)
LEFT JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopb.name = 'Craiglockhart'
```

### 10.  Show the bus no. and company for the first bus, the name of the stop for the transfer,

### and the bus no. and company for the second bus.

```sql
WITH Lochend AS (
	select c.num,c.company,c.stop
	from route c
	join route d 
	on c.num = d.num and c.company = d.company
	and c.stop != d.stop
	where d.stop =(select id from stops where name = 'Lochend')
)
, Craiglockhart AS (
	select a.num,a.company,b.stop
	from route a
	join route b
	on a.num = b.num and a.company = b.company
	and a.stop != b.stop
	where a.stop = (select id from stops where name ='Craiglockhart')
)

select distinct x.num 
								,x.company,name 
								,y.num 
								,y.company
from Craiglockhart as x
join Lochend as y
on x.stop = y.stop
join stops on x.stop = stops.id
order by x.num, stops.name, y.num
```