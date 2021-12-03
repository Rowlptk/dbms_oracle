begin

for row in
(select SSN_number from employee where TRUNC((SYSDATE - BIRTHDAY)/365.35) > 60) loop

dbms_output.put_line('Employee record with SSN = '||row.SSN_number||' deleted');

end loop;


delete from employee where TRUNC((SYSDATE - BIRTHDAY)/365.35) > 60;

end;
/

