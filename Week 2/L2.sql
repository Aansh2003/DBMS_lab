ALTER TABLE DROP CONSTRAINT FK_REPORTS_TO_EMPCODE;

--EMP
INSERT INTO EMP VALUES (100,'RAJESH','BTECH',NULL,'rajesh@digisol.com','DEVELOPER',NULL,101);
INSERT INTO EMP VALUES (101,'RAVI','MTECH',NULL,'ravid@digisol.com','PROJECT LEADER',NULL,102);
INSERT INTO EMP VALUES (102,'VIJAY','BTECH',NULL,'vijay@digisol.com','PROJECT MANAGER',NULL,110);
INSERT INTO EMP VALUES (108,'AJAY','BTECH',NULL,'ajay@digisol.com','TECHNICAL HEAD',NULL,102);
INSERT INTO EMP VALUES (110,'BHASKAR','MTECH',NULL,'bhaskar@digisol.com','PROJECT DIRECTOR',NULL,106);
INSERT INTO EMP VALUES (106,'RAJ','MSC',NULL,'raj@digisol.com','PROJECT DIRECTOR',NULL,110);
INSERT INTO EMP VALUES (105,'MANISH','MCA',NULL,'manish@digisol.com','DEVELOPER',NULL,106);
INSERT INTO EMP VALUES (106,'PRSAD','PHD',NULL,'prasad@digisol.com','CEO',NULL,NULL);
INSERT INTO EMP VALUES (107,'RAKESH','MTECH',NULL,NULL,NULL,NULL,NULL); --ORA-00001: unique constraint (DSE186.PK_EMPNO) violated
INSERT INTO EMP VALUES (108,'RAKESH','MTECH',NULL,NULL,'DEVELOPER',NULL,NULL); --ORA-00001: unique constraint (DSE186.PK_EMPNO) violated
INSERT INTO EMP VALUES (109,NULL,'MBA',NULL,NULL,NULL,NULL,NULL); --ORA-02290: check constraint (DSE186.VALID_QUALIF) violated
INSERT INTO EMP VALUES (110,NULL,NULL,NULL,NULL,'S.ENGINEER',NULL,NULL); --ORA-02290: check constraint (DSE186.VALID_DESIGNATION) violated
INSERT INTO EMP VALUES (111,'RAJ',NULL,NULL,'raj@digital.com',NULL,NULL,NULL); --ORA-02290: check constraint (DSE186.EMAIL_DOMAIN) violated

INSERT INTO EMP VALUES (107,'RAKESH','MTECH',NULL,NULL,NULL,NULL,NULL);
INSERT INTO EMP VALUES (112,'RAKESH','MTECH',NULL,NULL,'DEVELOPER',NULL,NULL);
INSERT INTO EMP VALUES (109,NULL,'MTECH',NULL,NULL,NULL,NULL,NULL);
INSERT INTO EMP VALUES (113,NULL,NULL,NULL,NULL,'DEVELOPER',NULL,NULL);
INSERT INTO EMP VALUES (111,'RAJ',NULL,NULL,'raj@digisol.com',NULL,NULL,NULL);

INSERT INTO EMP VALUES(199,'AANSH',NULL,NULL,NULL,'CEO',300000,NULL);

--SKILL
INSERT INTO SKILL VALUES('S1','FULL STACK');
INSERT INTO SKILL VALUES('S2','PYTHON');
INSERT INTO SKILL VALUES('S3','JAVA');
INSERT INTO SKILL VALUES('S4','C++');
INSERT INTO SKILL VALUES('S6','ORACLE');
INSERT INTO SKILL VALUES('S7','ANDROID');
INSERT INTO SKILL VALUES('S8','AZURE');
INSERT INTO SKILL VALUES('S9','DOT NET');
INSERT INTO SKILL VALUES('S10','IOS');

--CLIENT
INSERT INTO CLIENT VALUES('C1','ABC','+48-87489389','aaa@abc.com');
INSERT INTO CLIENT VALUES('C2','LTS','+91-78389397','bbb@lts.com');
INSERT INTO CLIENT VALUES('C3','RK','+44-67838934','ccc@rk.com');
INSERT INTO CLIENT VALUES('C4','MMA','+31-87489389','ddd@mma.com');
INSERT INTO CLIENT VALUES('C5','AKS','+81-66822903','eee@aks.com');
INSERT INTO CLIENT VALUES('C6','GKS','+78-75628982','fff@gks.com'); --ORA-02290: check constraint (DSE186.PHONE_FORMAT) violated
SET DEFINE OFF;
INSERT INTO CLIENT VALUES('C7','B\&B','+91-64839839','ggg@bb.com');
SET DEFINE ON;
INSERT INTO CLIENT VALUES('C8','ABT','+97-67554667',NULL); --ORA-02290: check constraint (DSE186.PHONE_FORMAT) violated
INSERT INTO CLIENT VALUES('C9','XYZ',NULL,'xyz.ab.com'); --ORA-02290: check constraint (DSE186.VALID_EMAIL) violated

INSERT INTO CLIENT VALUES('C6','GKS','+91-75628982','fff@gks.com');
INSERT INTO CLIENT VALUES('C8','ABT','+91-67554667',NULL);
INSERT INTO CLIENT VALUES('C9','XYZ',NULL,'xyz@ab.com');

ALTER TABLE CLIENT DROP CONSTRAINT PHONE_FORMAT;
ALTER TABLE CLIENT ADD CONSTRAINT PHONE_FORMAT CHECK(PHONE LIKE '+91-%' OR PHONE LIKE '+81-%' OR PHONE LIKE '+31-%' OR PHONE LIKE '+48-%' OR PHONE LIKE '+44-%');

ALTER TABLE CLIENT DROP CONSTRAINT VALID_EMAIL;
ALTER TABLE CLIENT ADD CONSTRAINT VALID_EMAIL CHECK(EMAIL LIKE '%_@_%.___');

--EMP_SKILL
INSERT INTO EMP_SKILL VALUES(100,'S1',15);
INSERT INTO EMP_SKILL VALUES(100,'S3',10);
INSERT INTO EMP_SKILL VALUES(101,'S1',6);
INSERT INTO EMP_SKILL VALUES(101,'S2',10);
INSERT INTO EMP_SKILL VALUES(102,'S4',18);
INSERT INTO EMP_SKILL VALUES(110,'S1',14);
INSERT INTO EMP_SKILL VALUES(110,'S6',20);
INSERT INTO EMP_SKILL VALUES(106,'S2',10);
INSERT INTO EMP_SKILL VALUES(106,'S6',12);
INSERT INTO EMP_SKILL VALUES(106,'S8',10);
INSERT INTO EMP_SKILL VALUES(108,'S9',5);
INSERT INTO EMP_SKILL VALUES(108,'S6',18);
INSERT INTO EMP_SKILL VALUES(105,'S7',12);
INSERT INTO EMP_SKILL VALUES(105,'S10',11);
INSERT INTO EMP_SKILL VALUES(101,'S2',7); --ORA-00001: unique constraint (DSE186.PK_EMPNO_SKILLID) violated

INSERT INTO EMP_SKILL VALUES(101,'S3',7);

--WORK_EXP
INSERT INTO WORK_EXP VALUES(100,'P1',20,'C1','A');
INSERT INTO WORK_EXP VALUES(100,'P3',15,'C3','A');
INSERT INTO WORK_EXP VALUES(101,'P1',16,'C1','A');
INSERT INTO WORK_EXP VALUES(102,'P2',18,'C2','B');
INSERT INTO WORK_EXP VALUES(102,'P1',18,'C1','A');
INSERT INTO WORK_EXP VALUES(108,'P2',12,'C2','C');
INSERT INTO WORK_EXP VALUES(106,'P3',20,'C3','C');
INSERT INTO WORK_EXP VALUES(106,'P4',10,'C4','C');
INSERT INTO WORK_EXP VALUES(105,'P2',19,'C2','B');
INSERT INTO WORK_EXP VALUES(110,'P4',12,'C4','B');
INSERT INTO WORK_EXP VALUES(110,'P5',16,'C8','A');
INSERT INTO WORK_EXP VALUES(105,'P5',5,'C5','D');
INSERT INTO WORK_EXP VALUES(111,'P5',5,'C5','C');

--PAY_CHECK
ALTER TABLE PAY_CHECK DROP COLUMN REGULAR_INCREMENT;
ALTER TABLE PAY_CHECK ADD REGULAR_INCREMENT NUMERIC(4) CONSTRAINT VAL CHECK(REGULAR_INCREMENT=2000 OR REGULAR_INCREMENT=3000 OR REGULAR_INCREMENT=5000 OR REGULAR_INCREMENT=7000 OR REGULAR_INCREMENT=9000);

ALTER TABLE PAY_CHECK DROP COLUMN PAY_DATE;
ALTER TABLE PAY_CHECK ADD PAY_DATE DATE;
ALTER TABLE PAY_CHECK ADD CONSTRAINT PRM_KEY PRIMARY KEY(EMPCODE,PAY_DATE);

INSERT INTO PAY_CHECK VALUES(100,NULL,NULL,NULL,2500,5000,'01-DEC-2020',,2000);
INSERT INTO PAY_CHECK VALUES(101,NULL,NULL,NULL,5000,7000,'01-DEC-2020',3000);
INSERT INTO PAY_CHECK VALUES(102,NULL,NULL,NULL,3600,7000,'01-DEC-2020',3000);
INSERT INTO PAY_CHECK VALUES(100,NULL,NULL,NULL,450,4000,'01-JAN-2020',3000);
INSERT INTO PAY_CHECK VALUES(101,NULL,NULL,NULL,2100,4000,'01-JAN-2020',5000);
INSERT INTO PAY_CHECK VALUES(102,NULL,NULL,NULL,NULL,9000,'01-JAN-2020',5000);
INSERT INTO PAY_CHECK VALUES(103,NULL,NULL,NULL,900,3000,'02-JAN-2020',7000); --ORA-02291: integrity constraint (DSE186.SYS_C0044783) violated - parent key not found

INSERT INTO PAY_CHECK VALUES(100,NULL,NULL,NULL,900,3000,'02-JAN-2020',7000);

--MEDICAL_POLICY
INSERT INTO MEDICAL_POLICY VALUES(100,'MED001',10000,'10-DEC-2020');
INSERT INTO MEDICAL_POLICY VALUES(101,'MED003',12000,'15-DEC-2020');
INSERT INTO MEDICAL_POLICY VALUES(100,'MED001',10000,'10-JAN-2020');
INSERT INTO MEDICAL_POLICY VALUES(101,'MED003',12000,'15-JAN-2020');
INSERT INTO MEDICAL_POLICY VALUES(103,'MED004',9000,'21-JAN-2020'); --ORA-02291: integrity constraint (DSE186.SYS_C0044712) violated - parent key not found

INSERT INTO MEDICAL_POLICY VALUES(106,'MED004',9000,'21-JAN-2020');

-- PRJ_DETAILS table
insert into PRJ_DETAILS (PRJID, PRJ_NAME, START_DATE, END_DATE,LEAD_BY_EMPCODE, BUDGET, ACTUAL_BUDGET)
values ('P1', 'SPYDER', '10-JAN-2020', '11-OCT-2022', 102, 2000000.0,1990000.0);
insert into PRJ_DETAILS (PRJID, PRJ_NAME, START_DATE, END_DATE, ACTUAL_END_DATE, LEAD_BY_EMPCODE, BUDGET, ACTUAL_BUDGET)
values ('P2', 'APOLLO', '01-JAN-2019', '10-JUL-2021', '30-DEC-2021', 108, 3000000.0,3600000.0);
insert into PRJ_DETAILS (PRJID, PRJ_NAME, START_DATE, END_DATE, LEAD_BY_EMPCODE, BUDGET, ACTUAL_BUDGET)
values ('P3', 'UNICORN', '03-SEP-2021', '10-OCT-2023', 106, 7500000.0,8000000.0);
insert into PRJ_DETAILS (PRJID, PRJ_NAME, START_DATE, END_DATE, ACTUAL_END_DATE, LEAD_BY_EMPCODE, BUDGET, ACTUAL_BUDGET)
values ('P4', 'ZEUS', '28-FEB-2020', '09-JUN-2021', '10-JAN-2022', 110, 5500000.0,5000000.0);
insert into PRJ_DETAILS (PRJID, PRJ_NAME, START_DATE, END_DATE, ACTUAL_END_DATE, LEAD_BY_EMPCODE, BUDGET, ACTUAL_BUDGET)
values ('P5', 'JUPITER', '07-AUG-2018', '04-FEB-2020', '01-NOV-2020', 110, 9000000.0,9000000.0);

-- Error:  check constraint (DSE214.END_DATE_GREATERTHN_START_DATE) violated
insert into PRJ_DETAILS (PRJID, PRJ_NAME, START_DATE, END_DATE,LEAD_BY_EMPCODE)
values ('P6', 'MARS', '21-FEB-2022', '07-AUG-2020', 110);
insert into PRJ_DETAILS (PRJID, PRJ_NAME, START_DATE, END_DATE,LEAD_BY_EMPCODE)
values ('P6', 'MARS', '21-FEB-2019', '07-AUG-2020', 110);

-- Error: cannot insert NULL into ("DSE214"."PRJ_DETAILS"."PRJID")
insert into PRJ_DETAILS (PRJID, PRJ_NAME)
values (NULL, 'XXX');
insert into PRJ_DETAILS (PRJID, PRJ_NAME)
values ('P8', 'XXX');

-- Error: integrity constraint (DSE214.SYS_C0049824) violated - parent key not
insert into PRJ_DETAILS (PRJID, LEAD_BY_EMPCODE)
values ('P7', 123);
insert into PRJ_DETAILS (PRJID, LEAD_BY_EMPCODE)
values ('P7', 105);



-- FAMILY DEPENDENTS

insert into FAMILY_DEPENDENTS
values (100, 'AJITH', 'SON', 12);
insert into FAMILY_DEPENDENTS
values (100, 'PRITHVI', 'DAUGHTER', 9);
insert into FAMILY_DEPENDENTS
values (101, 'AARYA', 'DAUGHTER', 17);
insert into FAMILY_DEPENDENTS
values (101, 'AKANKSH', 'SON', 11);
insert into FAMILY_DEPENDENTS
values (101, 'ANITHA', 'SPOUSE', 43);