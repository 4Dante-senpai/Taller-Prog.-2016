program recursion4;

const
    dimF = 15;  {Dimensión física del vector}

type

    vector = array [1..dimF] of integer;

    dim = 0..dimF;

{-----------------------------------------------------------------------------
CARGARVECTORORDENADO - Carga ordenadamente nros aleatorios entre 0 y 100 en el
vector hasta que llegue el nro 99 o hasta que se complete el vector}

Procedure cargarVectorOrdenado ( var vec: vector; var dimL: dim);
var
   d, pos, j: integer;
begin
    Randomize;  { Inicializa la secuencia de random a partir de una semilla}
    dimL := 0;
    d:= random(100);
    while (d <> 0)  and ( dimL < dimF ) do begin
       pos:= 1;
       while (pos <= dimL) and (vec[pos]< d) do pos:= pos + 1;
       for  j:= dimL downto pos do vec[j+1]:= vec[j] ;
       vec[pos]:= d;
       dimL := dimL + 1;
       d:= random(100)
     end;
end;

{-----------------------------------------------------------------------------
IMPRIMIRVECTOR - Imprime todos los nros del vector }

Procedure imprimirVector ( var vec: vector; var dimL: dim );
var
   i: dim;
begin
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     write (' ');
     for i:= 1 to dimL do begin
        if(vec[i] < 9)then
            write ('0');
        write(vec[i], ' | ');
     end;
     writeln;
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     writeln;
End;

{------------------------------------------------------------------------------
 BUSQUEDA DICOTOMICA            }

Procedure Busqueda_recursiva (elemento:integer; v: vector; var medio, inf, sup:dim; var ok: boolean);
Begin
  //calcula punto medio del vector

  medio:= (inf+sup) div 2;

  if (v[medio] = elemento) then
    ok:= true
  else
    if (inf <= sup) then begin // si el vector tiene elementos

            if(v[medio] < elemento) then // actualiza sup o inf
               sup:= medio+1
               else
               inf:= medio-1;

            Busqueda_recursiva (elemento, v, medio, inf, sup, ok);
            end
            else // el vector no tiene elementos
            ok:= false;

end;

{PROGRAMA PRINCIPAL}
var
   v: vector;
   dimL : dim;
   elemento:integer;
   medio, inf, sup: dim;
   ok: boolean;

begin

     cargarVectorOrdenado(v,dimL);
     sup:=dimL;
     inf:=1;
     writeln('Nros almacenados: ');
     imprimirVector(v, dimL);
     writeln('Ingrese el valor entero que desea buscar: ');
     readln (elemento);
     Busqueda_recursiva (elemento, v, medio, inf, sup, ok);

     if (ok = true) then
        writeln ('El elemento que usted busco se encuentra en la posicion: ', medio)
        else
        writeln ('El elemento que usted busco no se encuentra en el vector.');

     readln;
end.
