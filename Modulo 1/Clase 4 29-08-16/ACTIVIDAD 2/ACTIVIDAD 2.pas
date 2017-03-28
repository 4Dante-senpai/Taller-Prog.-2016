Program arboles;
Type

  // Lista de enteros
  lista = ^nodoL;
  nodoL = record
    dato: integer;
    sig: lista;
  end;

  // Arbol de enteros
  arbol= ^nodoA;
  nodoA = Record
    dato: integer;
    HI: arbol;
    HD: arbol;
  End;



{-----------------------------------------------------------------------------
INSERTAR - Inserta num en la lista pri manteniendo el orden creciente}
Procedure Insertar ( var pri: lista; num: integer);
var ant, nue, act: lista;
begin
   new (nue);
   nue^.dato := num;
   act := pri;
   ant := pri;
  { Recorro mientras no se termine la lista y no encuentro la posición correcta}
   while (act<>NIL) and (act^.dato < num) do begin
      ant := act;
      act := act^.sig ;
   end;
   if (ant = act) then pri := nue   {el dato va al principio}
                  else  ant^.sig  := nue; {el dato va entre otros dos o al final}
   nue^.sig := act ;
end;



{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista con números aleatorios }
procedure crearLista(var l: Lista);
var
  n: integer;
begin
 l:= nil;
 n := random (20);
 While (n <> 0) do Begin
   Insertar(L, n);
   n := random (20);
 End;
end;


{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
procedure imprimirLista(l: Lista);
begin
 While (l <> nil) do begin
   write(l^.dato, ' - ');
   l:= l^.sig;
 End;
end;

{-----------------------------------------------------------------------------
IMPRIMIRPORNIVEL - Muestra en pantalla el árbol a por niveles}
Procedure imprimirpornivel (a:arbol);
type
  lis= ^nodo;
  nodo=record
         dato: arbol;
         sig: lis;
        end;

var
 l,nodoaborrar:lis; nivel,i,long: integer; aux: arbol;

function longitud(l:lis): integer;
var s:integer;
begin
  s:= 0;
  While (l<>nil) do Begin
   s:= s+1;
   l:=l^.sig;
  End;
  longitud:= S
end;

Procedure agregaratras (var l:lis; a:arbol);
Var nue,aux:Lis;
  Begin
    New(nue);
    nue^.dato:=a;
    nue^.sig:=nil;
    if (l= NIL) then l:=nue
    else begin
           aux:= l;
           While (aux^.sig <> NIL) do
             aux:= aux^.sig;
           aux^.sig:= nue;
         end;
  End;
{--------------------Cuerpo procedure IMPRIMIRPORNIVEL---------------------}
begin
  if a= nil then writeln ('arbol vacio')
            else begin
              nivel:= 0;
              l:= nil;
              agregaratras (l, a);
              while (l <> nil) do begin
                write ('Nivel: ', nivel, '    ');
                long:= longitud (l);
                for i:= 1 to long do begin
                   aux:= l^.dato;
                   write (aux^.dato, ' ');
                   if aux^.HI <> Nil then agregaratras(l,aux^.HI);
                   if aux^.HD <> Nil then agregaratras(l,aux^.HD);
                   nodoaborrar:= l;
                   l:=l^.sig;
                   dispose(nodoaborrar);
                 end;
                 nivel := nivel+1;
                 writeln;
                 writeln;
              end;
             end;
end;
{---------FIN IMPRIMIRPORNIVEL--------------------------------------------------}



  //PROCESO CREAR NODO DEL ARBOL
 Procedure ca(var nodonuevo:arbol; dato: integer);
 Begin
      new(nodonuevo);
      nodonuevo^.dato := dato;
      nodonuevo^.HI:= nil;
      nodonuevo^.HD:= nil;
  end;


{------------------------------PROCESO INSERTAR----------------------------------}
Procedure insertar (var ar:arbol; dato: integer);
Var
   nodonuevo: arbol;
Begin
     if(ar= nil) then begin //si arbol es nil
          ca(nodonuevo, dato);
          ar:= nodonuevo;
          end
          else
          if (ar^.dato> dato)then //si el dato en árbol es > dato
             insertar(ar^.HI, dato)
             else
             insertar(ar^.HD, dato);

      end;



//------------------------------------------------------------------------------
Var

 l: lista; ar:arbol;

{Programa principal}

begin
 Randomize;

 crearLista(l);
 writeln ('Lista generada: ');
 imprimirLista(l);
 writeln ('  ');

 while (l <> nil) do begin
       insertar(ar, l^.dato);
       {AL TENER LA LISTA DE ELEMENTOS ORDENADA, AL MOMENTO DE CREAR EL ARBOL ÉSTE RECIBIRÁ TODOS
       ELEMENTOS MAYORES O IGUALES AL ANTERIOR, POR LO QUE LOS ALMACENARA SIEMPRE A LA DERECHA.
       DE ESTA FORMA TENDREMOS UN ARBOL EN DIAGONAL CON SOLO UN ELEMENTO POR NIVEL}
       l:= l^.sig;
       end;
 imprimirpornivel (ar);
 readln();
end.
