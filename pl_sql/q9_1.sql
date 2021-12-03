begin
for i in reverse 1 .. 100 loop
	dbms_output.put(i||' ');
end loop;
	dbms_output.new_line;
end;
/