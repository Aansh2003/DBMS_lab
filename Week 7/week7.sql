-- Q1

set serveroutput on
DECLARE
my_num number(10);
final number(10) := 0;
temp number(10);
begin
my_num := &my_num;
while my_num>0 loop
temp := mod(my_num,10);
my_num := my_num/10;
final := 10*final+temp;
end loop;
DBMS_OUTPUT.PUT_LINE(final);
end;
/

-- Q2

set serveroutput on
DECLARE
my_string varchar2(20);
my_string_temp varchar2(20);
BEGIN
my_string := '&my_string';
for i in REVERSE 1..length(my_string) LOOP
my_string_temp := my_string_temp || Substr(my_string, i, 1);
end loop;
if my_string = my_string_temp THEN
DBMS_OUTPUT.PUT_LINE('Palindrome');
ELSE
DBMS_OUTPUT.PUT_LINE('Not palindrome');
end if;
end;
/

-- Q3

set serveroutput on
DECLARE
my_emp emp.empcode%type;
my_display emp%ROWTYPE;
BEGIN
my_emp := &my_emp;
select * into my_display from emp where empcode = my_emp;
DBMS_OUTPUT.PUT_LINE(my_display.name);
end;
/

-- Q4

set serveroutput on
DECLARE
vowel_count number(10) := 0;
consonant_count number(10) := 0;
number_count number(10) :=0;
spl_count number(10) :=0;
my_string varchar2(10);
BEGIN
my_string := '&my_string';
for i in 1..length(my_string) LOOP
if (ascii(substr(my_string,i,1)) BETWEEN 65 and 90) or (ascii(substr(my_string,i,1)) BETWEEN 97 and 122) THEN
if ((substr(my_string,i,1)) in ('a','e','i','o','u','A','E','I','O','U')) THEN
vowel_count := vowel_count+1;
ELSE
consonant_count := consonant_count+1;
end if;
elsif (ascii(substr(my_string,i,1)) BETWEEN 48 and 57) then
number_count := number_count+1;
ELSE
spl_count := spl_count+1;
end if;
end loop;
DBMS_OUTPUT.PUT_LINE('Number of vowels:' || vowel_count);
DBMS_OUTPUT.PUT_LINE('Number of consonants:' || consonant_count);
DBMS_OUTPUT.PUT_LINE('Number of numbers:' || number_count);
DBMS_OUTPUT.PUT_LINE('Number of special:' || spl_count);
end;
/

-- Q5

set serveroutput on
DECLARE
my_code emp.empcode%type;
my_prj work_exp.prjid%TYPE;
salary emp.salary%type;
my_pr_name prj_details.prj_name%type;
rating work_exp.rating%type;
name emp.name%type;
temp number(10);
BEGIN
my_code := &my_code;
my_prj := '&my_prj';
select salary,prj_name,rating,name into salary,my_pr_name,rating,name from emp natural join work_exp natural join prj_details where empcode = my_code and prjid = my_prj;
DBMS_OUTPUT.PUT_LINE('Employee Code:' || my_code);
DBMS_OUTPUT.PUT_LINE('Employee Name:' || name);
DBMS_OUTPUT.PUT_LINE('Project Name:' || my_pr_name);
DBMS_OUTPUT.PUT_LINE('Rating:' || rating);
if rating = 'A' then 
temp := 10000;
elsif rating = 'B' THEN
temp := 5000;
ELSE
temp := 3000;
end if;
salary := salary + temp;
DBMS_OUTPUT.PUT_LINE('Salary:' || salary);
end;
/

-- Q6
