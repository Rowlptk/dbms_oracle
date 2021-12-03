declare
i number := 0;
cursor emp_details is select * from employee;
emp_records emp_details%ROWTYPE;

begin
open emp_details;

LOOP
	fetch emp_details into emp_records;
	
	exit when emp_details%NOTFOUND;
	i := i+1;
	dbms_output.put_line(i
				||'. Name = '
				||emp_records.first_name
				||' SSN = '
				||emp_records.ssn_number
				||' DEPT NO = '
				||emp_records.department_number
				||' SALARY = '
				||emp_records.salary);
END LOOP;
close emp_details;
end;
/