declare
n number := &n;
res number := 0;
begin
for i in 0 .. n loop
	if (mod(i,2) = 1) then
		res := res+i;
	end if;
end loop;
	dbms_output.put_line('Sum = '|| res);
end;
/