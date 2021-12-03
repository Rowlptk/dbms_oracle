declare
i number;
depn_no number;
no_of_emp number;

function no_of_emp_dept(dep_no number) return number is
begin
select count(*) into i from employee e, department d where e.department_number = d.department_number and d.department_number = dep_no;
return i;
end;

begin
depn_no := &depn_no;
no_of_emp := no_of_emp_dept(depn_no);
dbms_output.put_line('Total employee in department '||depn_no||' = '||no_of_emp);
end;
/