Program examen;
type
    cate=1..4;

    cadena=string[20];

    categorias=array[cate] of cadena;



    fe= record
        dia: 1..31;
        mes: 1..12;
        anio: 2000..2020;
        end;


    compra= record
            fecha: fe;
            prov: cadena;
            cant: integer;
            end;


    compra2= record
            prov: cadena;
            rep: integer;                 // lista 2, nodo2, y compra2 se van a usar para hacer el modulo 4
            end;

    lista2= ^nodo2;

    nodo2= record
          dato: compra2;
          sig: lista2;
          end;



    lista= ^nodo;

    nodo= record
          dato: compra;
          sig: lista;
          end;

    producto= record
              cod: integer;
              cat: cate;
              stock: integer;
              costo: real;
              comp: lista;
              end;

    listasmod4=array[cate] of lista;    //para el modulo 4

    // Arbol de productos
    arbol= ^nodoA;
    nodoA = Record
          dato: producto;
          HI: arbol;
          HD: arbol;
          end;
//-------------------------------------------------------------------------------
//                             MODULOS


// VECTOR QUE ALMACENA LOS NOMRES DE LAS CATEGORIAS EN CASO DE QUERER IMPRIMIRLAS
Procedure cargarvector(var v: categorias);
    begin
     v[1]:='Herramientas';
     v[2]:='Materiales';
     v[3]:='Herrajes';
     v[4]:='Componentes';
    end;


// INSERTAR LISTA  (inserta la compra en la lista de compras)
Procedure insertarlista(var l: lista; c: compra);
var ant, nue, act: lista;
begin
   new (nue);
   nue^.dato := c;
   act := l;
   ant := l;
  { Recorro mientras no se termine la lista y no encuentro la posición correcta}
   while (act<>NIL) and (act^.dato.prov < c.prov) do begin
      ant := act;
      act := act^.sig ;
   end;
   if (ant = act) then
                  l := nue   {el dato va al principio}
                  else
                  ant^.sig  := nue; {el dato va entre otros dos o al final}
   nue^.sig := act ;
end;



// LEER COMPRA
Procedure leercompra(var c: compra);


    begin

           writeln;
           writeln('Ingrese el proveedor de la compra (corta con el proovedor 0): ');
           readln(c.prov);
           if (c.prov <> '0') then begin
              writeln;
              writeln('Ingrese el dia de la compra: ');
              readln(c.fecha.dia);
              writeln;
              writeln('Ingrese el mes de la compra: ');
              readln(c.fecha.mes);
              writeln;
              writeln('Ingrese el anio de la compra: ');
              readln(c.fecha.anio);
              writeln;
              writeln('Ingrese la cantidad comprada: ');
              readln(c.cant);
              end;

           end;                                                                       // SE INGRESA EL PRODUCTO Y LUEGO TODAS LAS COMPRAS REALIZADAS DEL MISMO
                                                                                      // SE DEJAN DE LEER LAS COMPRAS AL LLEGAR EL PROVEEDPR CON EL NOMBRE '0'
                                                                                      // Y PASA A LEER UN NUEVO PRODUCTO HASTA QUE LLEGUE EL PROD CON CODIGO -1
//   LEER PRODUCTO
procedure leerproducto(var dato: producto);
    var
       c:compra;
    begin
         writeln;
         writeln('Ingrese el codigo del producto comprado: ');
         readln(dato.cod);
         if (dato.cod <> -1) then begin
            writeln;
            writeln('Ingrese la categoria del producto comprado: ');
            readln(dato.cat);
            writeln;
            writeln('Ingrese el stock del producto comprado: ');
            readln(dato.stock);
            writeln;
            writeln('Ingrese el costo del producto comprado: ');
            readln(dato.costo);
            leercompra(c);
            while (c.prov <> '0') do begin
                  insertarlista(dato.comp, c);
                  leercompra(c);
                  end;
            end;
         end;


//PROCESO CREAR NODO DEL ARBOL
 Procedure ca(var nodonuevo:arbol; dato: producto);
 Begin
      new(nodonuevo);
      nodonuevo^.dato := dato;
      nodonuevo^.HI:= nil;
      nodonuevo^.HD:= nil;

  end;


{------------------------------PROCESO INSERTAR----------------------------------}
Procedure insertar (var ar:arbol; dato: producto);
Var
   nodonuevo: arbol;
Begin

             if(ar = nil) then begin //si arbol es nil
                   ca(nodonuevo, dato);
                   ar:= nodonuevo;
                   end
                   else

                      if (ar^.dato.cod> dato.cod)then //si el dato en árbol es > dato
                         insertar(ar^.HI, dato)
                          else
                          insertar(ar^.HD, dato);



      end;



//--------------------------------------------------------------------------------------
//                              POST-ORDEN

Procedure postOrden( var a: arbol; g: integer );
begin
  if ( a <> nil ) then begin

    postOrden (a^.HI, g);
    postOrden (a^.HD, g);
    if (a^.dato.cat = g) then
       a^.dato.costo:= a^.dato.costo + 10;
  end;
end;



//                         VALORES EN EL RANGO

Procedure ValoresEnRango(a: arbol; var f: integer);

begin
  if ( a <> nil ) then begin
     if(a^.dato.cod >= 10)then begin
                if(a^.dato.cod <= 50) then begin
                           f := f+1;
                           ValoresEnRango(a^.HI, f);
                           ValoresEnRango(a^.HD, f);
                           end

                           else
                           ValoresEnRango(a^.HI, f);
                           end
                else

                ValoresEnRango(a^.HD, f);

  end;
end;


//oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
// INSERTAR LISTA MODULO 4 (inserta la compra en la lista de proveedor y cant si el cod es 80 ,90, 100 o 110)
Procedure agregaralFinal (var Ult: lista; var l2:lista2; rep:integer; n: cadena);
     Var
        aux:lista;
     Begin
        new (aux);
        aux^.dato.prov:= n;
        aux^.sig:= nil;
        if (l2= nil) then begin
           l2^.dato.prov :=aux^.dato.prov;
           l2^.dato.rep := rep;
           Ult:=aux;
           end
           else begin
           Ult^.sig:=aux;
           Ult:= aux;
           end;
     end;

                                                                                         ///////////////////////////////////////////////////////////////////
                                                                                         ///                                                             ///
Procedure Determinarminimo (var l80, l90, l100, l110: lista; var n:cadena);              /// MODULO NO TERMINADO. SON DEMASIADAS COMBINACIONES POSIBLES  ///
begin                                                                                    ///                                                             ///
 if (l80<>nil) and (l90 <> nil)and (l100 <> nil)and (l110 <> nil) then begin             ///////////////////////////////////////////////////////////////////
             if (l80^.dato.prov < l90^.dato.prov) and (l80^.dato.prov < l100^.dato.prov) and (l80^.dato.prov < l110^.dato.prov) then begin
                n:= l80^.dato.prov;            // l80 es el menor
                l80:=l80^.sig;
                end
                else
                if(l90^.dato.prov < l100^.dato.prov) and (l90^.dato.prov < l110^.dato.prov) then begin
                            n:= l90^.dato.prov;              // l90 es el menor
                            l90:=l90^.sig;
                            end
                            else
                            if (l90^.dato.prov < l110^.dato.prov) then begin
                               n:= l100^.dato.prov;
                               l100:=l100^.sig;               // l100 es el menor
                               end
                               else begin
                               n:= l110^.dato.prov;      // l110 es el menor
                               l110:=l110^.sig;
                               end;
                               end


             else if (l80<>nil) and (l90 <> nil)and (l100 <> nil) then begin          // si l110 esta vacia
                            if (l80^.dato.prov < l90^.dato.prov) and (l80^.dato.prov < l100^.dato.prov) then begin
                               n:= l80^.dato.prov;            // l80 es el menor
                               l80:=l80^.sig;
                               end
                               else
                               if(l90^.dato.prov < l100^.dato.prov) then begin
                                                 n:= l90^.dato.prov;              // l90 es el menor
                                                 l90:=l90^.sig;
                                                 end
                                                 else begin
                                                 n:= l100^.dato.prov;
                                                 l100:=l100^.sig;               // l100 es el menor
                                                 end

                             else if (l80<>nil) and (l90 <> nil)and (l110 <> nil) then begin          // si l100 esta vacia
                                     if (l80^.dato.prov < l90^.dato.prov) and (l80^.dato.prov < l100^.dato.prov) then begin
                                        n:= l80^.dato.prov;            // l80 es el menor
                                        l80:=l80^.sig;
                                        end
                                        else
                                        if(l90^.dato.prov < l100^.dato.prov) then begin
                                                 n:= l90^.dato.prov;              // l90 es el menor
                                                 l90:=l90^.sig;
                                                 end
                                                 else begin
                                                 n:= l110^.dato.prov;
                                                 l100:=l110^.sig;               // l110 es el menor
                                                 end;

                                  else if (l80<>nil) and (l90 <> nil)and (l110 <> nil) then begin          // si l100 esta vacia
                                          if (l80^.dato.prov < l90^.dato.prov) and (l80^.dato.prov < l100^.dato.prov) then begin
                                             n:= l80^.dato.prov;            // l80 es el menor
                                             l80:=l80^.sig;
                                             end
                                             else
                                             if(l90^.dato.prov < l100^.dato.prov) then begin
                                                 n:= l90^.dato.prov;              // l90 es el menor
                                                 l90:=l90^.sig;
                                                 end
                                                 else begin
                                                 n:= l110^.dato.prov;
                                                 l100:=l110^.sig;               // l110 es el menor
                                                 end;




end;
//------------------------------------------------------------------------------------------------------------------------------------

Procedure listamerge(vec: listasmod4; var l2:lista2);

Var
    n : cadena;
    Ult : lista;
    rep: integer;
Begin
  rep:=0;
  n:= '';
  Ult:= nil;
  while (vec[1] <> Nil) or (vec[2] <> Nil) or (vec[3] <> Nil) or (vec[4] <> Nil) do begin
         Determinarminimo(vec[1], vec[2], vec[3], vec[4], n);
         while (n = Ult^.dato.prov) do begin
                rep := rep+1;
                Determinarminimo(vec[1], vec[2], vec[3], vec[4], n);
                end;
                agregaralFinal (l2, Ult, rep, n);
   end;
end;

//oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo

Procedure recorrerarbol (a: arbol; var vec: listasmod4; var i:integer; b: integer);
begin
       if ( a^.dato.cod = b ) then              // como seguro existe nuestro punto de corte es cuando lo encuentra
             vec [i] := a^.dato.comp;
             else
             if(a^.dato.cod > b) then
                            recorrerarbol (a^.HI, l, b)
                            else
                            recorrerarbol (a^.HD, l, b);


end;


Procedure imprimirlista2(l2: lista2) ;
begin
          while (l2 <> nil) do begin
                writeln('Proveedor: ', l2^.dato.prov,' Repeticiones: ', l2^.dato.rep);
                l2 := l2^.sig;
                end;
end;

//-------------------------------------------------------------------------------
var
   ar: arbol; l2: lista2; v: categorias; dato: producto; f, g: integer; // f es contador del inciso 3, g es la categoria que quiere aumentar en el inciso 2
   b, i: integer; vec:listasmod4; // sirven para el recorrido acotado del modulo 4

begin
     f:= 0;
     l2 := nil;
     cargarvector(v);
     leerproducto(dato);
     while (dato.cod <> -1) do begin
       insertar(ar, dato);
       leerproducto(dato);
       end;
     // Agregarle $10 a todos los prod
     writeln('Ingrese la categoria a la que le quiere agregar $10 (1, 2, 3, 4): ');
     readln (g);
     postOrden(ar, g);
     ValoresEnRango(ar,f);
     writeln ('Los productos de categoria ', g,' han sido aumentados en $10');
     writeln;
     writeln ('La cantidad total de productos con cod entre 10 y 50  es: ',f);

     i:= 1;
     for a:=80 to 110 do begin
         recorrerarbol(ar, vec, i, b);
         a:= a+10;
         i:= i+1;  //se mueve en el vector
         end;    // aca ya tenemos el vector con las 4 listas


     listamerge(vec, l2);
     imprimirlista2(l2);


     readln();

end.
