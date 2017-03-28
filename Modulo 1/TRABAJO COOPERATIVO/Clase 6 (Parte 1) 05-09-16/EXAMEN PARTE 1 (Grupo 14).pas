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






//-------------------------------------------------------------------------------
var
   ar: arbol; v: categorias; dato: producto; f, g: integer; // f es contador del inciso 3, g es la categoria que quiere aumentar en el inciso 2


begin
     f:= 0;
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

     readln();

end.
