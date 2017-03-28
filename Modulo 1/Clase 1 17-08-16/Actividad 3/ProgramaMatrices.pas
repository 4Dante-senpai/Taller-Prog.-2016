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

 {-----------------------------------------------------------------------------------------

 INCISOS A, B Y C                       }

 Procedure incisoA (mat:Matriz);

           var
                   c,v,i,encontro:integer;
           begin
                 writeln('Inciso A: ingrese la Columa en la que desea buscar: ');
                 read(c);
                 writeln('Ingrese el valor que desea buscar: ');
                 read(v);

                 for i:=1 to max do begin
                   if mat[i][c]=v then
                      encontro:=i
                      else   encontro:= -1;
                 end;

                 if (encontro <> -1) then
                 writeln( 'lo encontro en la posicion: ',mat[i][c])
                      else  writeln(encontro);
                 end;
begin
  {carga matriz por fila}
  cargar (Mat);
  {mostrar matriz por filas}
  imprimir (Mat);

  incisoA (Mat);
  readln()
end.
