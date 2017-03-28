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
    rep: integer;
    HI: arbol;
    HD: arbol;
  End;



{-----------------------------------------------------------------------------
AgregarAdelante - Agrega nro adelante de l}
procedure agregarAdelante(var l: Lista; nro: integer);
var
  aux: lista;
begin
  new(aux);
  aux^.dato := nro;
  aux^.sig := l;
  l:= aux;
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
   agregarAdelante(L, n);
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

             if(ar = nil) then begin //si arbol es nil
                   ca(nodonuevo, dato);
                   ar:= nodonuevo;
                   end
                   else
                   if (ar^.dato <> dato) then begin //si el dato es igual, no lo inserta en el arbol
                      ar^.rep:=0;
                      if (ar^.dato> dato)then //si el dato en árbol es > dato
                         insertar(ar^.HI, dato)
                          else
                          insertar(ar^.HD, dato);
                      end
                      else
                      ar^.rep:= ar^.rep + 1;

      end;


//------------------------------------------------------------------------------
//                              BUSCAR

Procedure buscar( a: arbol; var e: arbol; n: integer);
begin

  if ( a <> nil ) then begin
     if (n = a^.dato) then

        e:= a    //si lo encuentra lo iguala
        else
          if (n < a^.dato) then begin
              a:= a^.HI;   //si el dato que busco es menor se la a la izq
              buscar(a, e, n);
              end
              else begin
              a:= a^.HD;   //sino va a la derecha
              buscar(a, e, n);
              end;
  end;


end;


//------------------------------------------------------------------------------
Var

 l: lista; ar, e:arbol; n: integer;

{Programa principal}

begin
 Randomize;
 new(e);
 e:= nil;
 crearLista(l);
 writeln ('Lista generada: ');
 imprimirLista(l);
 writeln (' ');
 writeln (' ');

 while (l <> nil) do begin
       insertar(ar, l^.dato);
       l:= l^.sig;
       end;
 imprimirpornivel (ar);
 writeln (' ');
 
 writeln('Ingrese el valor que desea buscar: ');
 readln (n);
 writeln ('EL NODO DEL DATO QUE USTED BUSCO: ');
 buscar(ar, e, n);
 if(e <> nil) then
      writeln ('El elemento fue encontrado.')
      else
      writeln('El elemento buscado no existe en el arbol.');

 readln;
end.
