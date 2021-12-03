declare
x number := &subject_1;
y number := &subject_2;
z number := &subject_3;
average number;
grade varchar(5);
begin
average := round(((x+y+z)/3), 0);
grade := CASE
		when average>90 and average<=100 then 'S'
		when average>80 and average<90 then 'A'
		when average>70 and average<80 then 'B'
		when average>60 and average<70 then 'C'
		when average>50 and average<60 then 'D'
		when average>40 and average<50 then 'E'
		when average>0 and average<40 then 'F'
		ELSE 'NA'
	end;
	dbms_output.put_line('GRADE : '||grade);
end;
/