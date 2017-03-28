Program b;
uses
    dos;
var
   h, min, s, s1 : word;
   inicio, parada : real;

function principio : real;
         begin
              principio := 0.0;
              gettime(h,min,s,s1);
              principio := (h * 3600) + (min * 60) + s + (s1 / 100);
         end;

function final : real;
         begin
              final := 0.0;
              gettime(h,min,s,s1);
              final := (h * 3600) + (min * 60) + s + (s1 / 100);
         end;

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
     writeln('Ingrese un numero: ');
     readln(m);
     inicio := principio;
     n:=1;
     primo(m,n);
     parada := final;
     writeln();
     writeln('**** TIEMPO TRANSCURRIDO **** = ',parada - inicio:0:2,' s');
     readln();
end.
