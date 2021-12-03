declare
i number := 1;

begin

for row in (select first_name, last_name, salary from employee where salary>1000 order by salary asc) loop

dbms_output.put_line(i||'. '||row.first_name||' '||row.last_name||' '||row.salary);

i := i+1;
end loop; 
end;
/