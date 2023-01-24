## 1월 3주차 문제 풀이 기록

- 최소 1주일에 1번은 문제 풀이 진행하기
- 문제 풀이 1번에 3문제는 풀기 (단, 최소 1문제는 중급 난이도)
- 성능 향상이 가능해 보이는 쿼리의 경우 나중에 따로 Keep해두기
- 문제 풀었을 때의 기록 외에도 **왜** 그렇게 작성했는지 생각해보기

`문제 플랫폼`     
Do it! Oracle 데이터베이스 입문

`문제 풀이에 참여한 날짜`
- [1월 24일](#1월-24일)
- [1월 25일](#1월-25일)

### 1

```sql
INSERT INTO CHAP10HW_DEPT (DEPTNO, DNAME, LOC) 
                    VALUES('50', 'ORACLE', 'BUSAN')
INSERT INTO CHAP10HW_DEPT (DEPTNO, DNAME, LOC) 
                    VALUES('60', 'SQL', 'ILSAN')
INSERT INTO CHAP10HW_DEPT (DEPTNO, DNAME, LOC) 
                    VALUES('70', 'SELECT', 'INCHEON')                
INSERT INTO CHAP10HW_DEPT (DEPTNO, DNAME, LOC) 
                    VALUES('80', 'DML', 'BUNDANG')
```

### 2

```sql
INSERT INTO CHAP10HW_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) 
                    VALUES('7201', 'TEST_USER1', 'MANAGER', '7788', '2016-01-02', '4500', NULL, '50')
                    
INSERT INTO CHAP10HW_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) 
                    VALUES('7202', 'TEST_USER2', 'CLERK', '7201', '2016-02-21', '1800', NULL, '50')                    

INSERT INTO CHAP10HW_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) 
                    VALUES('7203', 'TEST_USER3', 'ANALYST', '7201', '2016-04-11', '3400', NULL, '60')
                    
INSERT INTO CHAP10HW_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) 
                    VALUES('7204', 'TEST_USER4', 'SALESMAN', '7201', '2016-05-31', '2700', '300', '60')

INSERT INTO CHAP10HW_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) 
                    VALUES('7205', 'TEST_USER5', 'CLERK', '7201', '2016-07-20', '2600', NULL, '70')                    

INSERT INTO CHAP10HW_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) 
                    VALUES('7206', 'TEST_USER6', 'CLERK', '7201', '2016-09-08', '2600', NULL, '70') 

INSERT INTO CHAP10HW_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) 
                    VALUES('7207', 'TEST_USER7', 'LECTURER', '7201', '2016-10-28', '2300', NULL, '80') 

INSERT INTO CHAP10HW_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) 
                    VALUES('7208', 'TEST_USER8', 'STUDENT', '7201', '2016-10-28', '1300', NULL, '80')
```

### 3

```sql
UPDATE  CHAP10HW_EMP 
    SET     DEPTNO='70'
    WHERE   SAL > (
            SELECT AVG(SAL)
            FROM CHAP10HW_EMP
            WHERE DEPTNO='50'
    )
```

### 4

```sql
		 UPDATE     CHAP10HW_EMP
        SET     SAL = SAL * 1.1
                , DEPTNO ='80'
      WHERE     HIREDATE > (
	                SELECT MIN(HIREDATE)
	                FROM CHAP10HW_EMP    
	                WHERE DEPTNO = '60'
)
```

- `**UPDATE**`를 두 개 이상 동시에 적용하기 위해서는 ,(콤마)를 사용하여 조건으로 걸어주면 된다.

### 5

```sql
DELETE  FROM CHAP10HW_EMP 
		    WHERE   EMPNO IN (
        SELECT  E.EMPNO 
          FROM  CHAP10HW_EMP E, SALGRADE S
          WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
            AND GRADE = '5'   
    )
```

---

### 1월 25일

### 1

```sql
CREATE  TABLE   EMP_HW(
        EMPNO   NUMBER(4)
        , ENAME VARCHAR2(10)
        , JOB VARCHAR2(9)
        , MGR NUMBER(4)
        , HIREDATE DATE
        , SAL NUMBER(7,2)
        , COMM NUMBER(7,2)
        , DEPTNO NUMBER(2)
)
```

### 2

```sql
ALTER TABLE EMP_HW
        ADD BIGO VARCHAR2(20)
```

### 3

```sql
ALTER TABLE EMP_HW
     MODIFY BIGO VARCHAR(30)
```

### 4

```sql
ALTER TABLE EMP_HW
      RENAME COLUMN BIGO TO REMARK
```

### 5

```sql
INSERT  INTO EMP_HW
        SELECT  EMPNO
                , ENAME
                , JOB
                , MGR
                , HIREDATE
                , SAL
                , COMM
                , DEPTNO
                , NULL 
        FROM EMP
```

- `**INSERT INTO**`에 **subquery 적용**한 문제

### 6

```sql
DROP TABLE EMP_HW
```