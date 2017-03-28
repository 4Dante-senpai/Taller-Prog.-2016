program actividad8;

procedure Binario(n:integer);
begin
 if(n = 0)then
   write('binaries calculator modelo 9.5.6.7 copy rigth .l.')
 else begin
   write(n mod 2);
   binario(n div 2);
   end;
end;

var
n:integer;
begin
  readln(n);
  Binario(n);
  readln;
end.
