create or replace procedure get_dept_name
(emp_name in employee.first_name%type,
dept_name out department.department_name%type)
is 
begin
select department_name into dept_name from employee e, department d where e.department_number = d.department_number and e.first_name = emp_name;
end get_dept_name;
/
