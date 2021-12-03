begin

for row in
(select SSN_number, salary from employee where salary<2000) loop

dbms_output.put_line('Employee record with SSN = '||row.SSN_number||'and salary = '||row.salary||' deleted');

end loop;

delete from employee where salary<2000;

end;
/