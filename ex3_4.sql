select * from employee

select FIRST_NAME, MID_NAME, LAST_NAME from employee
where salary between 30000 and 70000

select * from employee where SUPERVISOR_SSN is null

select to_char(BIRTHDAY, 'DDthMonthYYYY') as Bdate from employee

select FIRST_NAME, MID_NAME, LAST_NAME from employee
where BIRTHDAY <= to_date('31-DEC-1978')

insert into department values('Mental Health', 6, 666884444, '01-JAN-93')

select DEPARTMENT_NAME from department where DEPARTMENT_NAME like 'M%';

select DEPARTMENT_NAME from department where DEPARTMENT_NAME like '%e';

select FIRST_NAME, MID_NAME, LAST_NAME from employee where SUPERVISOR_SSN in(123, 124)

select upper(DEPARTMENT_NAME) as upper, lower(DEPARTMENT_NAME) as lower from department

select substr(DEPARTMENT_NAME, 1, 4) as first_four,
substr(DEPARTMENT_NAME, -4) as last_four
from department

select substr(ADDRESS, 5, 11) as address_5_11 from employee 

select add_months(MANAGER_START_DATE, 3) as new_msrstratdate
from department

select round((SYSDATE - BIRTHDAY)/365.25, 2) as age from employee

select last_day(MANAGER_START_DATE)as lastday,
next_day(MANAGER_START_DATE, 'TUESDAY') as nextday_tuesday
from department

select substr('Harini',1, 6) from dual


select * from department
select * from employee


select substr('Harini',2, 3) from dual

select replace('Harini', 'ni', 'sh') from dual

select DEPARTMENT_NAME, length(DEPARTMENT_NAME) as Dname_length from department

select ADD_MONTHS(SYSDATE, 10) from dual

select NEXT_DAY(SYSDATE, 'FRIDAY') from dual

select LPAD(PROJECT_LOCATION, length(PROJECT_LOCATION)+4,'*') from project

select * from project


select TRUNC((SYSDATE - BIRTHDAY)/365.35) from employee

select DEPARTMENT_NUMBER, count(*) as TOTAL_COUNT from employee group by DEPARTMENT_NUMBER

select DEPARTMENT_NUMBER, min(SALARY) as MIN_SALARY, max(SALARY) as MAX_SALARY from employee group by DEPARTMENT_NUMBER

select ROUND(AVG(SALARY), 2) as Average_Annual_Salary from employee

select COUNT(*) as employee_over_30 from employee where TRUNC((SYSDATE - BIRTHDAY)/365.35) > 30

select DEPARTMENT_NAME, ROUND(AVG(SALARY), 2) from employee E, department D where E.DEPARTMENT_NUMBER = D.DEPARTMENT_NUMBER group by DEPARTMENT_NAME

select DEPARTMENT_NAME, COUNT(E.DEPARTMENT_NUMBER) as NO_OF_EMPLOYEE from employee E, department D where E.DEPARTMENT_NUMBER = D.DEPARTMENT_NUMBER group by DEPARTMENT_NAME having COUNT(E.DEPARTMENT_NUMBER) > 2

select DEPARTMENT_NUMBER, TRUNC((SYSDATE - BIRTHDAY)/365.35) as AGE, ROUND(AVG(SALARY), 2) as AVG_SALARY from employee group by DEPARTMENT_NUMBER, TRUNC((SYSDATE - BIRTHDAY)/365.35) order by DEPARTMENT_NUMBER

select DEPARTMENT_NAME, COUNT(E.DEPARTMENT_NUMBER) from employee e, department d
where DEPARTMENT_NAME in('Finance', 'Administration') and E.DEPARTMENT_NUMBER = D.DEPARTMENT_NUMBER group by DEPARTMENT_NAME

select * from employee order by BIRTHDAY

select * from department
select * from employee E, department D where E.DEPARTMENT_NUMBER = D.DEPARTMENT_NUMBER
