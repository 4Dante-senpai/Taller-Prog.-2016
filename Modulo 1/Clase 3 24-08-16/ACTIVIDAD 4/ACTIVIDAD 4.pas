program programaRecursion2;

{--------------------------------------
DIGITOMAXIMO. Calcula el digito maximo de n}
procedure digitoMaximo(n: integer; max: integer);
var
  dig: integer;
begin
  dig:= n mod 10;

  if(dig > max) then
    max:= dig;  // Imprime los valores máximos correspondientes a medida que se ejecuta el proceso
                // pero al finalizar el programa retorna el valor -1 porque al no estar pasado
  n:= n div 10; // por referencia va a conservar el valor asignado l principio del prog. (-1)
  if (n <> 0) then
    digitoMaximo(n, max);

  writeln ('max: ', max);

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

