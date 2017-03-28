Program b;

procedure primo(m:integer;var n:integer);
var
   i:integer;
begin
     i:=2;
     if (m>n) then begin
        while (n mod i <> 0) do
              i:=i+1;
        if (n mod i = 0) and (n<>i) then begin
           n:=n+1;
           primo(m,n);
           end
           else begin
                write(' ',n);
                n:=n+1;
                primo(m,n);
                end;
      end;
end;

var
   m,n:integer;
begin
     readln(m);
     n:=1;
     primo(m,n);
     readln();
end.


