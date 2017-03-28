{$R+} {Directiva de compilador R}
program CargaMatrices;
  const
    max = 5;

  type
    rangofila= 1..max;
    rangoCol= 1..max;
    Matriz = array [rangofila, rangoCol] of integer;

  var
    Mat: Matriz;

Procedure  Cargar (var M:Matriz);
var
  fil: rangofila;
  col: rangoCol;

Begin
  randomize;
  For fil:=1 to max do
    For col:= 1 to max do
      M[fil,col]:= random(100)
End;

Procedure  Imprimir (var M:Matriz);
 var
    fil: rangofila;
    col: rangoCol;
 begin
   For col := 1 to max do
     write ('-----');
   writeln;
   For fil:= 1 to max do begin
      For col:= 1 to max do begin
        if (M[fil,col] <10)then write ('0');
        write (M[fil,col], ' | ');
      end;
      writeln;
    end;
    For col := 1 to max do
        write ('-----');
   writeln;
 end;



begin
  {carga matriz por fila}
  cargar (Mat);
  {mostrar matriz por filas}
  imprimir (Mat);

  writeln('Inciso A)');
   writeln('elemento inexistente');
  writeln('Inciso B)');
  writeln(Mat[3][5]);
  writeln('Inciso C)');
  Mat[3][3]:= 0;
  imprimir (Mat);
  readln()
end.
