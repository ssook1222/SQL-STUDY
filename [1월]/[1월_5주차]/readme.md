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
- [1월 26일](#1월-26일)
- [1월 27일](#1월-27일)
- [1월 30일](#1월-30일)

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

---

### 1월 26일

### 제약조건

- 테이블의 특정 열에 지정하며, 지정한 열에 제약 조건에 부합하지 않는 데이터를 저장할 수 없음
- 제약 조건 지정 방식에 따라 기존 데이터의 수정이나 삭제 가능 여부도 영향을 받음

  예) `NOT NULL`

- 제약 조건을 지정한 열은 항상 제약 조건을 만족해야 하므로 신규 데이터의 삽입 뿐만 아니라 기존 데이터의 수정 및 삭제에도 영향을 줌

---

### 제약 조건 확인

- 지정한 제약 조건 정보를 확인하기 위해서는 다음과 같은 `USER_CONSTRAINTS` 데이터 사전을 활용해야 함.

  ![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/90746649-3618-47db-976d-46fa9f1aff60/Untitled.png)

  C : Check, Not null

  U : Unique

  P : Primary key

  R : Foreign key


---

### 제약 조건 이름 직접 지정

- 제약 조건에 따로 이름을 지정해주지 않을 경우 오라클에서 자동으로 이름이 지정됨.
- 제약 조건에 이름을 직접 지정하려면 `CONTSTRAINT` 키워드를 사용하여 설정
- 실무에서는 이름 붙이는 규칙을 정하여 제약 조건 이름을 직접 지정하는 경우가 많음

---

### 제약 조건을 지정하는 다른 방식

- `인라인, 열 레벨 제약 조건 정의`
    - 열 바로 옆에 제약 조건을 지정하는 형식
- `아웃오브라인, 테이블 레벨 제약 조건 정의`
    - NOT NULL 제약 조건을 제외한 제약 조건 지정이 가능

---

### Foreign key 지정하기

- 참고 대상을 지정하는 문법

```sql
CREATE TABLE 테이블이름(
	열 자료형 CONSTRAINT 제약조건 이름 REFERENCES 참조 테이블(참조할 열)
)
```

- 제약 조건 이름을 지정하지 않고 FOREIGN KEY를 지정할 수 있음

---

### 제약 조건 비활성화, 활성화

- 제약 조건은 데이터 무결성을 보장하는 데 중요한 역할을 수행하지만,

  신규 기능 개발 또는 테스트 같은 특정 업무를 수행해야 할 때 제약 조건이 걸림돌이 되기도 함.

- **비활성화**에는 `DISABLE` 절을, **활성화**에는 `ENABLE` 절을 사용함
    - DISABLE의 경우

        ```sql
        ALTER TABLE 테이블 이름
        DISABLE [NOVALIDATE/VALIDATE(선택)] CONSTRAINT 제약조건이름 
        ```

    - ENABLE의 경우

        ```sql
        ALTER TABLE 테이블 이름
        DISABLE [NOVALIDATE/VALIDATE(선택)] CONSTRAINT 제약조건이름 
        ```


→ 제약 조건의 제한을 위 두 방법처럼 일시적으로 풀어주는 방법이 존재함.

---

### Q1

```sql
CREATE TABLE DEPT_CONST(
    DEPTNO  NUMBER(2) CONSTRAINT DEPTCONST_DEPTNO_PK PRIMARY KEY,
    DNAME   VARCHAR(14) CONSTRAINT DEPTCONST_DNAME_UNQ UNIQUE,
    LOC     VARCHAR(2)  CONSTRAINT DEPTCONST_LOC_NM NOT NULL
)
```

```sql
CREATE TABLE EMP_CONST(
    EMPNO   NUMBER(4) CONSTRAINT EMPCONST_EMPNO_PK  PRIMARY KEY
    , ENAME   VARCHAR2(10) CONSTRAINT EMPCONST_ENAME_NN NOT NULL
    , JOB   VARCHAR2(9)
    , TEL   VARCHAR(2)  CONSTRAINT  EMPCONST_TEL_UNQ UNIQUE
    , HIREDATE DATE
    , SAL   NUMBER(7,2)  CONSTRAINT EMPCONST_SAL_CHK CHECK (SAL BETWEEN 1000 AND 9999)
    , COMM  NUMBER(7,2)
    , DEPTNO NUMBER(2)  CONSTRAINT EMPCONST_DEPTNO_FK REFERENCES DEPT_CONST (DEPTNO)
)
```

### Q2

```sql
SELECT  OWNER
        , CONSTRAINT_NAME
        , CONSTRAINT_TYPE
        , TABLE_NAME

FROM    USER_CONSTRAINTS
```

---

### 1월 27일

### 1-1

```sql
CREATE USER C##PREV_HW
IDENTIFIED BY ORCL
```

### 1-2

```sql
GRANT CREATE SESSION TO C##PREV_HW
```

### 2

```sql
GRANT   SELECT ON   EMP TO C##PREV_HW
GRANT   SELECT ON   DEPT TO C##PREV_HW
GRANT   SELECT ON   SALGRADE TO C##PREV_HW
```

- 테이블 있는 계정으로 가서 권한을 부여해야 함.
- 무턱대고 SYSTEM 계정에서 권한 부여하다가는 에러남

### 3

```sql
REVOKE  SELECT ON SALGRADE
FROM    C##PREV_HW
```

---

### 1월 30일

### 자동차 대여 기록에서 장기/단기 대여 구분하기

```sql
SELECT  HISTORY_ID
        , CAR_ID
        , TO_CHAR(START_DATE, 'YYYY-MM-DD')
        , TO_CHAR(END_DATE, 'YYYY-MM-DD')
        , CASE 
            WHEN END_DATE-START_DATE+1 >= 30 THEN '장기 대여'
            WHEN END_DATE-START_DATE+1 < 30 THEN '단기 대여'
         END AS RENT_TYPE
FROM    CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE   EXTRACT(MONTH FROM START_DATE) = 9
ORDER   BY HISTORY_ID DESC
```

- END_DATE - START_DATE + 1. 1을 더해줘야 기간이 제대로 나온다.

### 즐겨찾기가 가장 많은 식당 정보 출력하기

```sql
WITH A AS
(
    SELECT  FOOD_TYPE
            , MAX(FAVORITES) AS FAVORITES
    FROM    REST_INFO
    GROUP BY    FOOD_TYPE
)
SELECT  B.FOOD_TYPE
        , B.REST_ID
        , B.REST_NAME
        , B.FAVORITES
FROM A, REST_INFO B
WHERE A.FAVORITES = B.FAVORITES AND A.FOOD_TYPE = B.FOOD_TYPE
ORDER BY A.FOOD_TYPE DESC
```

- WITH 구문 써서 풀었음
- 개인적으로는 INNER JOIN 사용해갖구 명시한 다음 푸는 게 더 깔끔했을 듯

### 조건에 맞는 회원 수 구하기

```sql
SELECT  COUNT(*) AS USERS
FROM    USER_INFO
WHERE   EXTRACT(YEAR FROM JOINED) = 2021 AND AGE BETWEEN 20 AND 29
```

