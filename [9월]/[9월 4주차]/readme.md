# 9월 4주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

`문제 플랫폼`    
**`문제플랫폼`** SQLZOO

---

## The Join operation

### 1.

```sql
SELECT matchid, player 
FROM goal go inner join game ga on go.matchid = ga.id
WHERE go.teamid = 'GER'
```

### 2.

```sql
SELECT id,stadium,team1,team2
 FROM  game
WHERE  id = 1012
```

### 3.

```sql
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
 WHERE teamid = 'GER'
```

### 4.

```sql
SELECT team1, team2, player
  FROM game JOIN goal ON (id=matchid)
 WHERE player LIKE 'Mario%'
```

### 5.

```sql
SELECT player, teamid, coach, gtime
  FROM goal go inner join eteam et on go.teamid = et.id
 WHERE go.gtime<=10
```

### 6.

```sql
SELECT mdate, teamname
FROM game ga inner join eteam et on ga.team1 = et.id
WHERE et.coach = 'Fernando Santos'
```

### 7.

```sql
SELECT player
FROM game ga inner join goal go on ga.id = go.matchid
WHERE stadium = 'National Stadium, Warsaw'
```

### 8.

```sql
SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE (team1='GER' OR team2='GER') AND (teamid != 'GER')
```

### 9.

```sql
SELECT teamname, count(teamid)
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamid, teamname
 ORDER BY teamname
```

### 10.

```sql
SELECT stadium, count(player)
FROM game ga inner join goal go on ga.id = go.matchid
GROUP BY stadium
```

### 11.

```sql
SELECT matchid, mdate, count(teamid)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate, id
```

### 12.

```sql
SELECT matchid, mdate, count(teamid)
FROM goal go inner join game ga on go.matchid = ga.id
inner join eteam et on go.teamid = et.id
WHERE go.teamid = 'GER'
GROUP BY matchid, mdate
```

### 13.

```sql
SELECT mdate,
  team1,
  sum( CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
  team2,
  sum( CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
FROM game LEFT JOIN goal ON (id = matchid)
GROUP BY mdate,team1,team2
ORDER BY mdate, matchid, team1, team2
```

---

## JOIN QUIZ

### 1. You want to find the stadium where player 'Dimitris Salpingidis' scored. Select the JOIN condition to use:

```sql
game  JOIN goal ON (team1=teamid OR team2=teamid)
```

### 2. You JOIN the tables **goal** and **eteam** in an SQL statement. Indicate the list of column names that may be used in the SELECT line

```sql
matchid, teamid, player, gtime, id, teamname, coach
```

### 3. Select the code which shows players, their team and the amount of goals they scored against Greece(GRE).

```sql
SELECT player, teamid, COUNT(*)
  FROM game JOIN goal ON matchid = id
 WHERE (team1 = "GRE" OR team2 = "GRE")
   AND teamid != 'GRE'game  JOIN goal ON (id=matchid)
 GROUP BY player, teamid
```

### 4. Select the result that would be obtained from this code:

```sql
SELECT DISTINCT teamid, mdate
  FROM goal JOIN game on (matchid=id)
 WHERE mdate = '9 June 2012'
```

| DEN | 9 June 2012 |
| --- | --- |
| GER | 9 June 2012 |

### 5. Select the code which would show the player and their team for those who have scored against Poland(POL) in National Stadium, Warsaw.

```sql
SELECT DISTINCT player, teamid 
   FROM game JOIN goal ON matchid = id 
  WHERE stadium = 'National Stadium, Warsaw' 
 AND (team1 = 'POL' OR team2 = 'POL')
   AND teamid != 'POL'
```

### 6. Select the code which shows the player, their team and the time they scored, for players who have played in Stadion Miejski (Wroclaw) but not against Italy(ITA).

```sql
SELECT DISTINCT player, teamid, gtime
  FROM game JOIN goal ON matchid = id
 WHERE stadium = 'Stadion Miejski (Wroclaw)'
   AND (( teamid = team2 AND team1 != 'ITA') OR ( teamid = team1 AND team2 != 'ITA'))
```

### 7. Select the result that would be obtained from this code:

```sql
SELECT teamname, COUNT(*)
  FROM eteam JOIN goal ON teamid = id
 GROUP BY teamname
HAVING COUNT(*) < 3
```

| Netherlands | 2 |
| --- | --- |
| Poland | 2 |
| Republic of Ireland | 1 |
| Ukraine | 2 |