# 12월 2주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 왜 그렇게 작성했는지 생각해보기

**`문제플랫폼`** LeetCode, SQLBolt

---

### **180. Consecutive Numbers**

```sql
SELECT DISTINCT L1.NUM AS ConsecutiveNums
FROM LOGS L1
          INNER JOIN LOGS L2 ON L1.ID = L2.ID - 1
          INNER JOIN LOGS L3 ON L1.ID = L3.ID - 2
WHERE L1.NUM = L2.NUM AND L2.NUM = L3.NUM;
```

### **1164. Product Price at a Given Date**

```sql
WITH RAW AS (
  SELECT    PRODUCT_ID
            , COALESCE(MAX(CHANGE_DATE), '2019-08-16') AS MAX_CHANGE_DATE
  FROM      PRODUCTS P
  WHERE     P.CHANGE_DATE <= '2019-08-16'
  GROUP BY  PRODUCT_ID
),

ALL_PRODUCTS AS (
  SELECT DISTINCT PRODUCT_ID
  FROM PRODUCTS
)

SELECT    AP.PRODUCT_ID
          , COALESCE(MAX(P.NEW_PRICE), 10) AS PRICE
FROM      ALL_PRODUCTS AP
LEFT JOIN RAW R ON AP.PRODUCT_ID = R.PRODUCT_ID
LEFT JOIN PRODUCTS P ON R.PRODUCT_ID = P.PRODUCT_ID AND R.MAX_CHANGE_DATE = P.CHANGE_DATE
GROUP BY  AP.PRODUCT_ID;
```

→ COALESCE 함수는 **표현식 목록에 널(NULL)이 아닌 첫 표현식을 리턴**함

### Find the longest time that an employee has been at the studio

```sql
WITH A AS 
	(
		SELECT  name
		        , Years_employed 
		FROM    employees
		GROUP BY    Years_employed 
		ORDER BY    Years_employed DESC
	)

SELECT NAME
        , MAX(Years_employed) as Year 
FROM A
;
```