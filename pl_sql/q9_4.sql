declare
n number;
f number;
res number;

function fact(x number) return number is
begin
	if x = 0 then
	   f := 1;
	else
	   f := x * fact(x-1);
	end if;
return f;
end;

begin
n := &n;
res := fact(n);
dbms_output.put_line('Factorial of '||n||' = '||res);
end;
/