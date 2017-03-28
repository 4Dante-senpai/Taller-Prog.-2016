program programaRecursion2;

{--------------------------------------
DIGITOMAXIMO. Calcula el digito maximo de n}
procedure digitoMaximo(n: integer; var max: integer);
var
  dig: integer;
begin
  dig:= n mod 10;

  if(dig > max) then
    max:= dig;

  n:= n div 10;
  if (n <> 0) then        // EL CASO BASE EN ESTE EJERCICIO ES CUANDO YA SE
    digitoMaximo(n, max); // DESCOMPUSO POR COMPLETO EL NUMERO N (n mod 10 = 0).
                          // Se aproxima al caso base descomponiendo el número
  writeln ('max: ', max); // dígito por dígito hasta que se descompuso por
                          // completo: : n div 10 = 0
end;

var	
   max, num: integer;

{programa principal}
Begin
  max:= -1;

  writeln( 'Ingrese un valor entero:');
  readln(num);

  digitoMaximo(num, max);

  writeln();
  writeln('El maximo digito de ',num,' es ', max);

  readln;
End.

