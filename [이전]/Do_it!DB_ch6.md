# 6장

### 1

```sql
SELECT EMPNO
       , RPAD(SUBSTR(EMPNO, -LENGTH(EMPNO), 2),LENGTH(EMPNO),'*') AS MASKING_EMPNO
       , ENAME
       , RPAD(SUBSTR(ENAME, -LENGTH(ENAME), 2),LENGTH(ENAME),'*') AS MASKING_ENAME 

FROM EMP
WHERE LENGTH(ENAME)=5
```

- 좌변 가공이 있지만, Length를 사용해 더 수정할 방법을 모르겠어서 Fix.

### 2

```sql
SELECT EMPNO
       ,ENAME
       ,SAL
       ,ROUND(SAL/21.5,1) AS DAY_PAY
       ,ROUND(SAL/21.5/8,1) AS TIME_PAY
FROM EMP
```

### 3

[[Error] NVL 사용시 ORA-01722: 수치가 부적합합니다. 오류](https://javabuilders.tistory.com/65)

```sql
SELECT EMPNO
       ,ENAME
       ,TO_CHAR(HIREDATE,'YYYY-MM-DD') AS HIREDATE
       ,TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE,3),'월요일'),'YYYY-MM-DD') AS R_JOB
       ,NVL(TO_CHAR(COMM), 'N/A') AS COMM
FROM EMP
```

### 4

```sql
SELECT EMPNO
       ,ENAME
       ,NVL(TO_CHAR(MGR), ' ') AS MGR
       ,CASE  
             WHEN TO_CHAR(MGR) LIKE '75%' THEN '5555'
             WHEN TO_CHAR(MGR) LIKE '76%' THEN '6666'
             WHEN TO_CHAR(MGR) LIKE '77%' THEN '7777'
             WHEN TO_CHAR(MGR) LIKE '78%' THEN '8888'
             WHEN MGR IS NULL THEN '0000'
             ELSE TO_CHAR(MGR)
                  END AS CHG_MGR
FROM EMP
```