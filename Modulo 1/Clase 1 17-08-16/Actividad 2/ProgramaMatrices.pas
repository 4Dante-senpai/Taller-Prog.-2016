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
{------------------------------------------------------------------------------
INCISOS A, B y C         }

Procedure incisoA (Mat:Matriz);

        var
        f,i: integer;
        begin
             for i:=1 to max do begin
                 Mat [5][i]:= Mat [5][i]*2;
                 end;

             writeln('MATRIZ INCISO A:');
             imprimir (Mat);
             end;
Procedure incisoB (Mat:Matriz);

        var
        i: integer;
        begin

             for i:=1 to max do begin
               Mat[i][i]:= Mat[i][i]-1
                 end;

             writeln('MATRIZ INCISO B:');
             imprimir (Mat);
             end;

Procedure incisoC (Mat:Matriz);

        var
        i,c: integer;
        begin

             for i:=1 to max do begin
                for c:=1 to max do begin
               Mat[i][c]:= Mat[i][c] mod 5;
                 end;
               end;

             writeln('MATRIZ INCISO C:');
             imprimir (Mat);
             end;

begin
  {carga matriz por fila}
  cargar (Mat);
  {mostrar matriz por filas}
  imprimir (Mat);

  incisoA (Mat);
  incisoB (Mat);
  incisoC (Mat);
  readln()
end.
