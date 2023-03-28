1.select NAME FROM EMP WHERE DESIGNATION = (SELECT DESIGNATION FROM EMP WHERE EMPCODE = 100);

-- RAJESH
-- MANISH
-- RAKESH

2.SELECT NAME FROM EMP WHERE REPORTS_TO IN( SELECT EMPCODE FROM EMP WHERE NAME='VIJAY');

-- RAVI

3. SELECT NAME,DESIGNATION,EMAIL FROM EMP NATURAL JOIN WORK_EXP WHERE PRJID IN (SELECT PRJID FROM EMP NATURAL JOIN WORK_EXP WHERE NAME = 'VIJAY');

-- NAME       DESIGNATION          EMAIL
-- ---------- -------------------- --------------------
-- VIJAY      PROJECT MANAGER      vijay@digisol.com
-- MANISH     DEVELOPER            manish@digisol.com
-- AJAY       TECHNICAL HEAD       ajay@digisol.com
-- RAJESH     DEVELOPER            rajesh@digisol.com
-- RAVI       PROJECT LEADER       ravid@digisol.com
-- VIJAY      PROJECT MANAGER      vijay@digisol.com

4. SELECT NAME FROM EMP NATURAL JOIN FAMILY_DEPENDENTS WHERE RELATIONSHIP = 'DAUGHTER';

-- NAME
-- ----------
-- RAJESH
-- RAVI
-- VIJAY
-- AJAY

5. SELECT NAME FROM EMP WHERE EMPCODE NOT IN(SELECT EMPCODE FROM WORK_EXP NATURAL JOIN PRJ_DETAILS WHERE PRJ_NAME = 'SPYDER');

-- NAME
-- ----------
-- MANISH
-- PRSAD
-- RAKESH
-- AJAY

-- BHASKAR
-- RAJ
-- RAKESH

-- AANSH

6. SELECT DISTINCT NAME FROM EMP NATURAL JOIN EMP_SKILL WHERE SKILLID IN(SELECT DISTINCT SKILLID FROM WORK_EXP NATURAL JOIN EMP_SKILL WHERE PRJID = 'P1');

-- NAME
-- ----------
-- RAVI
-- BHASKAR
-- RAKESH
-- AJAY
-- AANSH
-- MANISH
-- VIJAY
-- RAJ

-- RAJESH
-- PRSAD

7. SELECT NAME FROM EMP NATURAL JOIN WORK_EXP WHERE PRJID = 'P1' AND WORK_EXPERIENCE > ALL(SELECT WORK_EXPERIENCE FROM WORK_EXP WHERE PRJID = 'P2');

-- NAME
-- ----------
-- RAJESH

8. 
9. SELECT NAME FROM EMP NATURAL JOIN WORK_EXP WHERE PRJID NOT IN ( SELECT PRJID FROM WORK_EXP WHERE EMPCODE = 106);

-- NAME
-- ----------
-- VIJAY
-- AJAY
-- MANISH
-- RAJESH
-- RAVI
-- VIJAY
-- BHASKAR
-- RAJ

10) SELECT PRJID FROM PRJ_DETAILS WHERE BUDGET_ALLOCATED > (SELECT DISTINCT SUM(SALARY) FROM PRJ_DETAILS NATURAL JOIN EMP GROUP BY PRJID);

-- PRJ
-- ---
-- P1
-- P2
-- P3
-- P4
-- P5

15)WITH TEMP(EMPCODE,SKILL_COUNT) AS (SELECT EMPCODE,SUM(WORK_EXPERIENCE) FROM WORK_EXP GROUP BY EMPCODE)
SELECT NAME FROM EMP NATURAL JOIN TEMP WHERE SKILL_COUNT>20;

-- NAME
-- ----------
-- RAJESH
-- VIJAY
-- PRSAD
-- BHASKAR

17)UPDATE EMP SET SALARY = SALARY + 10*SALARY/100 WHERE DESIGNATION = 'PROJECT LEADER';
UPDATE EMP SET SALARY = SALARY + 5*SALARY/100 WHERE DESIGNATION = 'DEVELOPER';

18)CREATE VIEW EMP_SKILL_EXPERIENCE AS
WITH TEMP(EMPCODE,SKILL_COUNT) AS (SELECT EMPCODE,SUM(WORK_EXPERIENCE) FROM WORK_EXP GROUP BY EMPCODE)
SELECT NAME,SKILLNAME,SKILL_EXPERIENCE FROM EMP NATURAL JOIN TEMP NATURAL JOIN EMP_SKILL NATURAL JOIN SKILL WHERE SKILL_COUNT>20;

19) CREATE VIEW EMP_DESIGNATION AS
SELECT EMPCODE AS EMPNO,NAME,SALARY FROM EMP WHERE DESIGNATION IN ('PROJECT LEADER','DEVELOPER');

20) SELECT NAME,COUNT(NAME) FROM EMP NATURAL JOIN WORK_EXP GROUP BY NAME;

-- NAME       COUNT(NAME)
-- ---------- -----------
-- RAVI                 1
-- BHASKAR              2
-- AJAY                 1
-- AANSH                1
-- MANISH               1
-- VIJAY                2
-- RAJ                  1
-- RAJESH               2
-- PRSAD                2

-- Question 5.11

select PRJ_NAME, count(t1.EMPCODE) from EMP t1
join WORK_EXP t2 on t1.EMPCODE = t2.EMPCODE 
join PRJ_DETAILS t3 on t2.PRJID = t3.PRJID
where RATING = 'A' or RATING = 'B'
group by PRJ_NAME
order by count(t1.EMPCODE) desc;

-- PRJ_NAME   COUNT(T1.EMPCODE)
-- ---------- -----------------
-- SPYDER                     3
-- APOLLO                     2
-- JUPITER                    1
-- ZEUS                       1
-- UNICORN                    1

-- Question 5.12

select PRJ_NAME, count(t1.EMPCODE) from EMP t1
join WORK_EXP t2 on t1.EMPCODE = t2.EMPCODE 
join PRJ_DETAILS t3 on t2.PRJID = t3.PRJID
having count(t1.EMPCODE) > 2
group by PRJ_NAME
order by count(t1.EMPCODE) desc;

-- PRJ_NAME   COUNT(T1.EMPCODE)
-- ---------- -----------------
-- SPYDER                     3
-- APOLLO                     3

-- Question 5.13

select NAME, count(t2.DEP_NAME) from EMP t1
join FAMILY_DEPENDENTS t2 on t1.EMPCODE = t2.EMPNO
group by NAME;

-- NAME       COUNT(T2.DEP_NAME)
-- ---------- ------------------
-- RAVI                        3
-- RAJESH                      3

-- Question 5.14

select sum(PREMIUM) from EMP t1
join MEDICAL_POLICY t2 on t1.EMPCODE = t2.EMPNO
group by extract(year from POLICYDATE);

-- SUM(PREMIUM)
-- ------------
       -- 53000

-- Question 5.15

select NAME, sum(SKILL_EXPERIENCE) from EMP t1
join EMP_SKILL t2 on t1.EMPCODE = t2.EMPNO
group by NAME
having sum(SKILL_EXPERIENCE) > 20
order by sum(SKILL_EXPERIENCE) desc;

-- NAME       SUM(SKILL_EXPERIENCE)
-- ---------- ---------------------
-- BHASKAR                       34
-- RAJ                           32
-- RAJESH                        25
-- MANISH                        23
-- RAVI                          23
-- AJAY                          23