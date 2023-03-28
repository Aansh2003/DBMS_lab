--4.1
SELECT * FROM CLIENT;
-- CLI NAME       PHONE          EMAIL
-- --- ---------- -------------- --------------------
-- C10 AAN                       aan@abc.com
-- C1  ABC        +48-87489389   aaa@abc.com
-- C2  LTS        +91-78389397   bbb@lts.com
-- C3  RK         +44-67838934   ccc@rk.com
-- C4  MMA        +31-87489389   ddd@mma.com
-- C5  AKS        +81-66822903   eee@aks.com
-- C7  B&B        +91-64839839   ggg@bb.com
-- C6  GKS        +91-75628982   fff@gks.com
-- C8  ABT        +91-67554667
-- C9  XYZ                       xyz@ab.com

--4.2
SELECT NAME,PHONE, EMAIL FROM EMP WHERE DESIGNATION = 'DEVELOPER';

-- NAME            PHONE EMAIL
-- ---------- ---------- --------------------
-- RAJESH                rajesh@digisol.com
-- MANISH                manish@digisol.com
-- RAKESH

--4.3
SELECT NAME FROM EMP WHERE REPORTS_TO = 106;

-- NAME
-- ----------
-- AJAY
-- BHASKAR
-- MANISH

--4.4
SELECT NAME,EMAIL FROM EMP WHERE DESIGNATION = 'TECHNICAL HEAD' AND QUALIFICATION = 'BTECH';

-- NAME       EMAIL
-- ---------- --------------------
-- AJAY       ajay@digisol.com

--4.5
SELECT NAME FROM EMP WHERE SALARY BETWEEN 100000 AND 200000;

-- no rows selected

--4.6
SELECT SKILLID FROM EMP_SKILL WHERE EMPNO = 101;

-- SKI
-- ---
-- S1
-- S2
-- S3

--4.7
SELECT SKILLNAME FROM SKILL NATURAL JOIN EMP_SKILL WHERE EMPNO = 101;

-- SKILLNAME
-- --------------------
-- FULL STACK
-- PYTHON
-- JAVA

--4.8
SELECT EMPCODE FROM WORK_EXP WHERE (CLIENTID = 'C1' OR CLIENTID = 'C2') AND (RATING = 'A' OR RATING = 'B');

   -- EMPCODE
-- ----------
       -- 100
       -- 101
       -- 102
       -- 102
       -- 105

--4.9
SELECT NAME FROM EMP NATURAL JOIN WORK_EXP WHERE (CLIENTID = 'C2' AND RATING = 'B');

-- NAME
-- ----------
-- VIJAY
-- MANISH

--4.10
SELECT COUNT(EMPNO) FROM FAMILY_DEPENDENTS NATURAL JOIN EMP WHERE NAME = 'RAVI';

-- COUNT(EMPNO)
-- ------------
           -- 6

--4.11
SELECT NAME,DESIGNATION,SALARY*12 AS ANNUAL_SALARY FROM EMP;

-- NAME       DESIGNATION          ANNUAL_SALARY
-- ---------- -------------------- -------------
-- RAJESH     DEVELOPER
-- RAVI       PROJECT LEADER
-- VIJAY      PROJECT MANAGER
-- AJAY       TECHNICAL HEAD
-- BHASKAR    PROJECT DIRECTOR
-- MANISH     DEVELOPER
-- PRSAD      CEO
-- RAKESH
-- RAKESH     DEVELOPER

-- RAJ

-- NAME       DESIGNATION          ANNUAL_SALARY
-- ---------- -------------------- -------------
           -- DEVELOPER
-- AANSH      CEO                        3636000

--4.12

--

--4.13
SELECT NAME FROM PRJ_DETAILS NATURAL JOIN EMP WHERE ACTUAL_END_DATE <= END_DATE AND ACTUAL_BUDGET < BUDGET_ALLOCATED;

--no rows selected

--4.14
SELECT NAME,SALARY ,ADVANCE_TAX,REGULAR_INCREMENT FROM EMP NATURAL JOIN PAY_CHECK WHERE EXTRACT(MONTH FROM PAY_DATE) = 3;

-- no rows selected

--4.15
SELECT A.NAME,B.NAME FROM EMP A INNER JOIN EMP B ON A.REPORTS_TO = B.EMPCODE;

-- NAME       NAME
-- ---------- ----------
-- RAJESH     RAVI
-- RAVI       VIJAY
-- VIJAY      BHASKAR
-- AJAY       PRSAD
-- BHASKAR    PRSAD
-- MANISH     PRSAD

--4.16
SELECT * FROM PRJ_DETAILS ORDER BY ACTUAL_END_DATE DESC;

-- PRJ PRJ_NAME   START_DAT END_DATE  ACTUAL_EN LEAD_BY_EMPCODE BUDGET_ALLOCATED
-- --- ---------- --------- --------- --------- --------------- ----------------
-- ACTUAL_BUDGET
-- -------------
-- P1  SPYDER     10-JAN-20 11-OCT-22                       102          2000000
      -- 1990000

-- P8  XXX


-- P3  UNICORN    03-SEP-21 10-OCT-23                       106          7500000
      -- 8000000


-- PRJ PRJ_NAME   START_DAT END_DATE  ACTUAL_EN LEAD_BY_EMPCODE BUDGET_ALLOCATED
-- --- ---------- --------- --------- --------- --------------- ----------------
-- ACTUAL_BUDGET
-- -------------
-- P7                                                       105


-- P6  MARS       21-FEB-19 07-AUG-20                       110


-- P4  ZEUS       28-FEB-20 09-JUN-21 10-JAN-22             110          5500000
      -- 5000000


-- PRJ PRJ_NAME   START_DAT END_DATE  ACTUAL_EN LEAD_BY_EMPCODE BUDGET_ALLOCATED
-- --- ---------- --------- --------- --------- --------------- ----------------
-- ACTUAL_BUDGET
-- -------------
-- P2  APOLLO     01-JAN-19 10-JUL-21 30-DEC-21             108          3000000
      -- 3600000

-- P5  JUPITER    07-AUG-18 04-FEB-20 01-NOV-20             110          9000000


			  
--4.17
SELECT NAME,SKILL_EXPERIENCE FROM (EMP NATURAL JOIN EMP_SKILL) NATURAL JOIN SKILL ORDER BY EMPCODE ASC,SKILL_EXPERIENCE DESC;

-- NAME       SKI
-- ---------- ---
-- RAJESH     7
-- RAJESH     6
-- RAJESH     5
-- RAJESH     20
-- RAJESH     18

--4.18
SELECT NAME,DEP_NAME,AGE FROM EMP NATURAL JOIN FAMILY_DEPENDENTS WHERE RELATIONSHIP = 'SON' ORDER BY NAME ASC,AGE DESC;

-- NAME       DEP_NAME                    AGE
-- ---------- -------------------- ----------
-- AANSH      AAN                          19
-- AANSH      AJITH                        12
-- AANSH      AKANKSH                      11
-- AJAY       AAN                          19
-- AJAY       AJITH                        12
-- AJAY       AKANKSH                      11

--4.19
SELECT NAME,PRJ_NAME FROM EMP NATURAL JOIN PRJ_DETAILS NATURAL JOIN WORK_EXP ORDER BY NAME DESC,EMPCODE ASC;

-- NAME       PRJ_NAME
-- ---------- ----------
-- VIJAY      APOLLO
-- VIJAY      SPYDER
-- RAVI       SPYDER
-- RAJESH     SPYDER
-- RAJESH     UNICORN
-- RAJ        JUPITER
-- PRSAD      UNICORN
-- PRSAD      ZEUS
-- MANISH     APOLLO
-- BHASKAR    ZEUS
-- BHASKAR    JUPITER

-- NAME       PRJ_NAME
-- ---------- ----------
-- AJAY       APOLLO
-- AANSH      ZEUS

--4.20
SELECT NAME FROM EMP NATURAL JOIN PRJ_DETAILS NATURAL JOIN WORK_EXP WHERE PRJ_NAME = 'SPYDER' UNION SELECT NAME FROM EMP NATURAL JOIN PRJ_DETAILS NATURAL JOIN WORK_EXP WHERE PRJ_NAME = 'APOLLO';

-- NAME
-- ----------
-- AJAY
-- MANISH
-- RAJESH
-- RAVI
-- VIJAY

--4.21
SELECT NAME FROM EMP NATURAL JOIN EMP_SKILL NATURAL JOIN SKILL WHERE SKILLNAME = 'AZURE' UNION SELECT NAME FROM EMP NATURAL JOIN EMP_SKILL NATURAL JOIN SKILL WHERE SKILLNAME = 'ORACLE';

-- NAME
-- ----------
-- AANSH
-- AJAY
-- BHASKAR
-- MANISH
-- PRSAD
-- RAJ
-- RAJESH
-- RAKESH
-- RAVI
-- VIJAY

--4.22
SELECT NAME FROM EMP NATURAL JOIN PRJ_DETAILS NATURAL JOIN WORK_EXP MINUS SELECT NAME FROM EMP NATURAL JOIN PRJ_DETAILS NATURAL JOIN WORK_EXP WHERE PRJ_NAME = 'JUPITOR';

-- NAME
-- ----------
-- AANSH
-- AJAY
-- BHASKAR
-- MANISH
-- PRSAD
-- RAJ
-- RAJESH
-- RAVI
-- VIJAY

--4.23
select NAME from EMP where REPORTS_TO is null;

-- NAME
-- ----------
-- PRSAD
-- RAKESH
-- RAKESH

-- RAJ

-- AANSH

--4.24
select NAME, EMAIL from EMP where EMAIL like 'ra%';

-- NAME       EMAIL
-- ---------- --------------------
-- RAJ        raj@digisol.com
-- RAJESH     rajesh@digisol.com
-- RAVI       ravid@digisol.com

--4.25
select PRJ_NAME from PRJ_DETAILS where START_DATE between '01-JAN-2020' and '14-DEC-2020';

-- PRJ_NAME
-- ----------
-- SPYDER
-- ZEUS

--4.26
select NAME from EMP natural join EMP_SKILL where SKILLID in (select SKILLID from EMP_SKILL where EMPNO = 101);

-- NAME
-- ----------
-- RAJESH
-- RAVI
-- VIJAY
-- AJAY
-- BHASKAR