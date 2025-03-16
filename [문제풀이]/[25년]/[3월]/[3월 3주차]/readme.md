# 3월 3주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

### 오랜 기간 보호한 동물

```sql
select animal_ins.name, animal_ins.datetime
from animal_ins left join animal_outs on animal_ins.animal_id = animal_outs.animal_id
where animal_outs.datetime is null
order by animal_ins.datetime asc limit 3
```

### 없어진 기록 찾기

```sql
SELECT animal_outs.animal_id, 
       animal_outs.name
FROM animal_outs 
LEFT JOIN animal_ins ON animal_outs.animal_id = animal_ins.animal_id
WHERE animal_ins.animal_id IS NULL;
```

### 보호소에서 중성화한 동물

```sql
SELECT ao.animal_id, ao.animal_type, ao.name
FROM animal_outs ao
LEFT JOIN animal_ins ai ON ao.animal_id = ai.animal_id
WHERE SUBSTR(ai.sex_upon_intake, 1, 6) = 'Intact'
AND ai.sex_upon_intake != ao.sex_upon_outcome;
```