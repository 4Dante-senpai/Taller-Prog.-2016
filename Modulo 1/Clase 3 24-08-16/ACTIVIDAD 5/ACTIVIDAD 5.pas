program programaRecursion3;

{--------------------------------------
SUMATORIA. Calcula la sumatoria de n}
function sumatoria(n: integer): integer;
begin

     if (n = 0) then                     //va sumando n y le resta 1, lo vuelve
        sumatoria:= 0                    //a sumar y le vuelve a restar 1, y asi
        else                             //sucesivamente hasta que n=0
        sumatoria := n + sumatoria(n-1)
end;

var	
   num: integer;

{programa principal}
Begin
  writeln( 'Ingrese un valor entero:');
  readln(num);

  writeln();
  writeln('La sumatoria de ',num,' es ', sumatoria(num));

  readln;
End.

