accept x number prompt "Enter employee no : "
declare
emp_no number := &x;
e_salary number;
begin
select salary into e_salary from employee where SSN_NUMBER=emp_no;
dbms_output.put_line('The Salary of employee '||emp_no||' is '|| e_salary);
end;
/