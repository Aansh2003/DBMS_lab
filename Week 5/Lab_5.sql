-- Question 5.1

select NAME from EMP where DESIGNATION in 
(select DESIGNATION from EMP where EMPCODE = 100);

-- name
-- ----------
-- rajesh
-- manish

-- Question 5.2

select NAME from EMP where REPORTS_TO in 
(select EMPCODE from EMP where NAME = 'VIJAY');

-- NAME
-- ----------
-- RAVI
-- AJAY

-- Question 5.3

select NAME, DESIGNATION, EMAIL from EMP natural join EXPERIENCE
where PRJID in 
(select PRJID from EMP natural join EXPERIENCE where NAME = 'VIJAY');

-- Question 5.4

select NAME from EMP right join FAMILY_DEPENDENTS 
on EMP.EMPCODE = FAMILY_DEPENDENTS.EMPNO
where RELATIONSHIP = 'DAUGHTER';

-- NAME
-- ----------
-- RAJESH
-- RAVI

-- Question 5.5

select NAME from EMP 
right join WORK_EXP on EMP.EMPCODE = WORK_EXP.EMPCODE
right join PRJ_DETAILS on WORK_EXP.PRJID = PRJ_DETAILS.PRJID
where PRJ_NAME != 'SPYDER';

-- NAME       
-- ----------
-- RAJESH    
-- VIJAY     
-- AJAY      
-- RAJ       
-- RAJ       
-- MANISH    
-- BHASKAR   
-- BHASKAR    
-- RAJ        

-- Question 5.6

select distinct(NAME) from EMP
right join EMP_SKILL on EMP.EMPCODE = EMP_SKILL.EMPNO
where SKILLID in (
select distinct(SKILLID) from EMP
right join EMP_SKILL on EMP.EMPCODE = EMP_SKILL.EMPNO
right join WORK_EXP on EMP.EMPCODE = WORK_EXP.EMPCODE 
where PRJID = 'P1');

-- NAME
-- ----------
-- RAVI
-- BHASKAR
-- VIJAY
-- RAJ
-- RAJESH

-- Question 5.7

select NAME from EMP 
right join WORK_EXP on EMP.EMPCODE = WORK_EXP.EMPCODE
where PRJID = 'P1' and WORK_EXPERIENCE > 
		(select MAX(WORK_EXPERIENCE) from EMP 
		right join WORK_EXP on EMP.EMPCODE = WORK_EXP.EMPCODE
		where PRJID = 'P2'
		);
		
-- NAME
-- ----------
-- RAJESH

-- Question 5.8

-- Question 5.9

SELECT NAME FROM EMP NATURAL JOIN WORK_EXP WHERE PRJID NOT IN ( SELECT PRJID FROM WORK_EXP WHERE EMPCODE = 106);

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

-- Question 5.10

SELECT PRJID FROM PRJ_DETAILS WHERE BUDGET_ALLOCATED > (SELECT DISTINCT SUM(SALARY) FROM PRJ_DETAILS NATURAL JOIN EMP GROUP BY PRJID);

-- PRJ
-- ---
-- P1
-- P2
-- P3
-- P4
-- P5

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


-- Question 5.16

WITH TEMP(EMPCODE,SKILL_COUNT) AS (SELECT EMPCODE,SUM(WORK_EXPERIENCE) FROM WORK_EXP GROUP BY EMPCODE)
SELECT NAME FROM EMP NATURAL JOIN TEMP WHERE SKILL_COUNT>20;

-- NAME
-- ----------
-- RAJESH
-- VIJAY
-- PRSAD
-- BHASKAR


-- Question 5.17

UPDATE EMP SET SALARY = SALARY + 10*SALARY/100 WHERE DESIGNATION = 'PROJECT LEADER';
UPDATE EMP SET SALARY = SALARY + 5*SALARY/100 WHERE DESIGNATION = 'DEVELOPER';

-- Question 5.18

CREATE VIEW EMP_SKILL_EXPERIENCE AS
WITH TEMP(EMPCODE,SKILL_COUNT) AS (SELECT EMPCODE,SUM(WORK_EXPERIENCE) FROM WORK_EXP GROUP BY EMPCODE)
SELECT NAME,SKILLNAME,SKILL_EXPERIENCE FROM EMP NATURAL JOIN TEMP NATURAL JOIN EMP_SKILL NATURAL JOIN SKILL WHERE SKILL_COUNT>20;

-- Question 5.19
CREATE VIEW EMP_DESIGNATION AS
SELECT EMPCODE AS EMPNO,NAME,SALARY FROM EMP WHERE DESIGNATION IN ('PROJECT LEADER','DEVELOPER');


-- Question 5.20

SELECT NAME,COUNT(NAME) FROM EMP NATURAL JOIN WORK_EXP GROUP BY NAME;

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

