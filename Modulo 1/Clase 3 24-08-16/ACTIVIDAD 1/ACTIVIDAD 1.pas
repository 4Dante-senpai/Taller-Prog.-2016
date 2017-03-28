program programaRecursion;

{------------------------------------------
FACTORIAL1 -
-------- Analizar funcionamiento !! --------}
Function factorial1 (n: integer): integer;

begin
  writeln (n);
  factorial1 := n * factorial1(n-1);
end;



{------------------------------------------
FACTORIAL2 -
-------- Analizar funcionamiento !! --------}
Function factorial2 (n: integer): integer;
begin
  writeln (n);
  if (n <= 1) then
    factorial2:= 1
  else
    factorial2 := n * factorial2(n);
end;


{------------------------------------------
FACTORIAL - Calculo de factorial de n. }
Function factorial(n: integer): integer;
begin
  if (n <= 1) then
    factorial:= 1
  else
    factorial := n * factorial(n-1);   
end;


var 
  num: integer;

Begin

  writeln( 'Ingrese un entero no negativo:');
  readln (num);
  writeln ( num, '! = ', factorial1(num));

  { Al no checkear si lleg� al CASO BASE no termina nunca el proceso de forma
  tal que el programa se ejecutar� infinitamente }

  readln;

End.

