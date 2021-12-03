declare
i number := 0;
cursor emp_details is select e.first_name, e.ssn_number, d.department_name, e.salary, d.manager_ssn from employee e, department d where e.department_number = d.department_number;

emp_records emp_details%ROWTYPE;

begin
open emp_details;

dbms_output.put_line('SN'||' Name  '||'   SSN       '||'   DEPT Name   '||'       SALARY   '||'    MANAGER SSN   ');
LOOP
	fetch emp_details into emp_records;
	
	exit when emp_details%NOTFOUND;
	i := i+1;
	dbms_output.put_line(i ||'  '||emp_records.first_name
			||'   '||emp_records.ssn_number
			||' '||emp_records.department_name
			||'        '||emp_records.salary
			||'        '||emp_records.manager_ssn);
END LOOP;
close emp_details;
end;
/