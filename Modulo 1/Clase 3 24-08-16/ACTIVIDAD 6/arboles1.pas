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
AgregarAdelante - Agrega nro adelante de l}
procedure agregarAdelante(var l: Lista; nro: integer);
var
  act,ant,aux: lista;
begin
  new(aux);
  aux^.dato := nro;
  aux^.sig := l;
  act:=l;
  while(act^.dato < nro) do begin
        ant:=act;
        act:=act^.sig;
  end;

  if(l = nil) then
    l:=aux
   else
       if(act=l)then begin
              aux^.sig:=l;
              l:=aux;
              end;
         if(act<>nil)then begin
                          ant^.sig:=aux;
                          aux^.sig:=act;
                          l:=act;
                         end
                      else
                          ant^.sig:=aux;



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

procedure insertar(var a:arbol;i:integer);
var
huevo:arbol;
begin
if (a = nil)then
begin
     new(huevo);
     huevo^.hi:=nil;
     huevo^.hd:=nil;
     huevo^.dato:=i;
     a:=huevo;
   end
   else
   if(a^.dato > i) then
      insertar(a^.hi , i)
              else
                  insertar(a^.hd,i);
end;

procedure insetarA(var a:arbol;l:lista);
begin
while(l<>nil)do begin
                insertar(a,l^.dato);
                l:=l^.sig;
end;
end;

Var

l: lista; a:arbol;

begin
 Randomize;
 a:=nil;
 crearLista(l);
 writeln ('Lista generada: ');
 imprimirLista(l);
 insetarA(a, l);
 writeln();
 Imprimirpornivel(a);
 readln;

end.
