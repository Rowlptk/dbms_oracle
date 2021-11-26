select FIRST_NAME||' '||MID_NAME||' '||LAST_NAME as employee , SALARY from employee
where salary = (select max(salary) from employee where DEPARTMENT_NUMBER in 
(select DEPARTMENT_NUMBER from department where DEPARTMENT_NAME = 'Research'))


select DEPARTMENT_NAME, FIRST_NAME||' '||MID_NAME||' '||LAST_NAME as EMPLOYEE,  SALARY from employee e, department d
where e.DEPARTMENT_NUMBER = d.DEPARTMENT_NUMBER and SALARY in 
(select MIN(SALARY) from EMPLOYEE group by DEPARTMENT_NUMBER )

select FIRST_NAME||' '||MID_NAME||' '||LAST_NAME as employee, SALARY from employee 
where salary > (select AVG(SALARY) from EMPLOYEE where DEPARTMENT_NUMBER = 2)

select DEPARTMENT_NAME, count(*) as employee_strength from
employee e, department d where e.DEPARTMENT_NUMBER = d.DEPARTMENT_NUMBER
group by DEPARTMENT_NAME

select department_name, count(e.department_number) as highest_emp_strength
from department d, employee e 
where d.department_number = e.department_number
having count(e.department_number) = 
(select MAX(count(*)) from employee group by department_number)
group by department_name


select department_name, AVG(salary) as average_salary from employee e, department d
where e.department_number = d.department_number
group by department_name


select department_name, AVG(salary) as MAX_AVG_SALARY from 
employee e, department d
where e.department_number = d.department_number
having AVG(SALARY) = (select MAX(AVG(SALARY)) from employee group by department_number) group by department_name

update employee set department_number = 4
where department_number is null

create view IT_employee as
select * from employee where department_number = 
(select department_number from department where department_name = 'IT')

select * from IT_employee

create table logical_emp_table as 
select first_name || ' ' || mid_name || ' ' || last_name as FULL_NAME, salary from employee where salary > 10000

select * from logical_emp_table

create table emp_details_with_dep_no as
select first_name || ' ' || mid_name || ' ' || last_name as FULL_NAME, department_number from employee

select * from emp_details_with_dep_no


update project 
set PROJECT_LOCATION = 'Houston'
where PROJECT_NUMBER = 22

select e.first_name || ' ' || e.mid_name || ' ' || e.last_name as FULL_NAME, e.address,
p.project_name, p.project_number, p.project_location, d.dep_no
from project p, works_on w, dept_locations d, employee e
where p.project_number = w.project_no
and p.department_number = d.dep_no
and e.SSN_NUMBER = w.EMPLOYEE_SSN
and p.project_location = 'Houston' 
and d.dep_no not in (select dep_no from dept_locations where dep_loc = 'Houston')
/*-----------------------------------*/
select distinct e.first_name || ' ' || e.mid_name || ' ' || e.last_name as employee_with_no_dependents
from employee e, employee s
where e.ssn_number = s.supervisor_ssn
and e.SUPERVISOR_SSN not in 
(select e.SUPERVISOR_SSN from employee e, dependent d
where e.SUPERVISOR_SSN = d.EMPLOYEE_SSN)
/*--------------------------------*/

select first_name||' '||mid_name||' '||last_name as employee_with_no_dependents 
from employee, department
where ssn_number = manager_ssn
and manager_ssn not in (select employee_ssn from dependent)

select first_name||' '||mid_name||' '||last_name as employee_as_manager, department_name
from employee, department
where ssn_number = manager_ssn

select project_name, project_number, count(employee_ssn) as no_of_employee from
project left join works_on
on project_number = project_no 
group by project_name, project_number
order by project_name

select project_name, sum(hours) as total_hours_per_week from
project left join works_on
on project_number = project_no
group by project_name, project_number
order by project_name

select first_name||' '||mid_name||' '||last_name as employee_name, 
count(employee_ssn) as dependent_count
from employee, dependent
where ssn_number = employee_ssn
group by first_name||' '||mid_name||' '||last_name
having count(employee_ssn) >= 2