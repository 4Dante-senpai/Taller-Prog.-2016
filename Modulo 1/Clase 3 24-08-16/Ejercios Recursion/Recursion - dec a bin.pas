Program a;
procedure convertir(n:integer);
var j:integer;
begin
     if (n div 2 = 0) then begin
        write(n mod 2);
        end
        else begin
             j:= n mod 2;
             n:= n div 2;
             convertir(n);
             write(j);
        end;
end;
var
n:integer;
begin
readln(n);
while (n<>0) do begin
      convertir(n);
      writeln('');
      readln(n);
end;
readln()

end.
