accept x number prompt "Enter employee SSN to delete : "
declare
emp_no number := &x;
begin
delete from employee where SSN_NUMBER=emp_no;
dbms_output.put_line('Employee record with SSN = '||emp_no||' deleted');
end;
/
