Program listas;
Type
  Lista= ^Nodo;
  Nodo= Record
           Datos: integer;
           Sig: Lista;
        End;


{-----------------------------------------------------------------------------
INSERTAR - Inserta num en la lista pri manteniendo el orden creciente}
Procedure Insertar ( var pri: lista; num: integer);
var ant, nue, act: lista;
begin
   new (nue);
   nue^.datos := num;
   act := pri;
   ant := pri;
  { Recorro mientras no se termine la lista y no encuentro la posición correcta}
   while (act<>NIL) and (act^.datos < num) do begin
      ant := act;
      act := act^.sig ;
   end;
   if (ant = act) then pri := nue   {el dato va al principio}
                  else  ant^.sig  := nue; {el dato va entre otros dos o al final}
   nue^.sig := act ;
end;


{-----------------------------------------------------------------------------
CREARLISTAORDENADA - Genera una lista con números aleatorios ordenados de forma
creciente}
procedure crearListaOrdenada(var l: Lista);
var
  n: integer;
begin
 n := random (50);
 While (n <> 0) do Begin
   Insertar (L, n);
   n := random (50);
 End;
end;


{-----------------------------------------------------------------------------
IMPRIMIR - Imprime la lista pri}
Procedure Imprimir (pri:lista);
Begin
   while (pri <> NIL) do begin
     write (pri^.datos, ' ');
     pri:= pri^.sig
  end;
  writeln;
end;

{--------------------------------------------------------------------------
   ACTIVIDAD 2 (modulo determinarminimo)   }

Procedure Determinarminimo (var L, L2: Lista; var n:integer);
begin
 if (L<>nil) and (L2 <> nil) then begin
             if (L^.Datos < L2^.Datos) then begin
                n:= L^.Datos;
                L:=L^.Sig;
                end
                else begin
                     n:= L2^.Datos;
                     L2:=L2^.Sig;
                     end;
                end
             else if (L<> nil) then begin {sólo L1 tiene elementos}
                  n:= L^.Datos;
                  L:=L^.Sig;
                  end
                  else begin{sólo L2 tiene elementos}
                       n:= L2^.Datos;
                       L2:=L2^.Sig;
                       end;
             end;





Var
 L, L2: Lista;
 n:integer;
begin
 randomize;
 L:=nil;
 L2:=nil;
 CrearListaOrdenada (L);
 CrearListaOrdenada (L2);
 Imprimir (L);
 writeln ('');
 Imprimir (L2);
 Determinarminimo (L, L2, n);
 writeln ('');
 writeln ('El menor es: ', n);
  Determinarminimo (L, L2, n);
 writeln ('');
 writeln ('El menor es: ', n);
  Determinarminimo (L, L2, n);
 writeln ('');
 writeln ('El menor es: ', n);
  Determinarminimo (L, L2, n);
 writeln ('');
 writeln ('El menor es: ', n);
 readln;
end.
