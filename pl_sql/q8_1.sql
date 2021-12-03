declare
a number;
b number;
c number;
begin
a:=&a;
b:=&b;
c:=&c;

if(a>b) and (a>c) then
dbms_output.put_line(a ||' is Greatest!');
elsif(b>c) then
dbms_output.put_line(b ||' is Greatest!');
else
dbms_output.put_line(c ||' is Greatest!');
end if;

end;
/