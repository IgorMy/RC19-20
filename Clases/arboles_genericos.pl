
/*

  Árboles genéricos
  
      1    arbol1
	 / | \ 
   3  4  5
 
   Árbol más pequeño (n0): a(E, [])
   
   a(E, ListaHijos)
  
   ListaHijo es una lista de árboles

             1        arbol2
		     / | \ 
          2  3  4
		   /|\    |
        5 6 7   8
*/

arbol1(a(1, [a(3,[]), a(4, []), a(5, [])])).
arbol2(
   a(1,[a(2,[a(5,[]),a(6,[]),a(7,[])]),a(3,[]),a(4,[a(8,[])])])
).

/*
   pertenece(E,Arbol)
      es cierto si el elemento E pertenece al 
      árbol genérico Arbol
*/

/* predicado para árboles */

pertenece(E,a(E,_)).

pertenece(E,a(Et,ListaHijos)):- E \= Et, pertenece(E,ListaHijos).

/* predicado para listas de árboles, como es un OR tienes que poner dos reglas*/

pertenece(E,[Cab|_]) :- pertenece(E,Cab).

pertenece(E,[_|Resto]) :- pertenece(E,Resto).

/*
   cuenta_nodos(+Arbol, -N)
      es cierto si N unifica con el número de
      nodos del árbol genérico Arbol
*/

/* predicado para arboles  */

cuenta_nodos(a(_,Lista), N2) :- cuenta_nodos(Lista,N),N2 is N+1.

/* predicado para listas */

cuenta_nodos([],0).
cuenta_nodos([Cabeza|Resto], N3 ) :- cuenta_nodos(Cabeza,N) , cuenta_nodos(Resto,N2), N3 is N + N2.

/*
   hojas(+Arbol, -ListaHojas)
      Es cierto si Lista hojas unifica con la lista
      de las etiquetas de las hojas del árbol Arbol
*/

/* predicado para arboles */

hojas(a(E,[]),[E]).
hojas(a(_,Nodos),Lista):- Nodos \= [], hojas(Nodos,Lista).
%Prolo siempre va ha intentar unifica, por lo que si no se comprueba que la lista sea vacia, unificara por igual tanto en la linea 69 como 70 con un arbol de un solo elemento

/* predicado para listas */

hojas([],[]).
hojas([Cabeza|Resto],Lista3) :- hojas(Cabeza,Lista1),hojas(Resto,Lista2),append(Lista1,Lista2,Lista3).

/*
   crea(+Lista, -Arbol)
   es cierto si Arbol unifica con un árbol genérico que contiene todos
   los elementos de Lista
*/

crea([E],a(E,[])).
crea([Cabeza|Resto], a(Cabeza,[Arbol])) :- crea(Resto,Arbol).

/* Otra alternativa */

creaArbol([Cab|Resto], a(Cab,R)) :- creaListaArboles(Resto,R).

creaListaArboles([],[]).
creaListaArboles([Cab|Resto], [a(Cab,[])|R]) :- creaListaArboles(Resto,R).

/*
   anchura2(+Arbol, -Lista)
      es ciero si Lista unifica con una lista 
      que contiene el recorrido en anchuura 
      del árbol generico Arbol

             1        arbol2
		     / | \ 
          2  3  4
		   /|\    |
        5 6 7   8
*/

anchura2(a(E,[]),[E]).
anchura2(a(E,Lista), [E|Lista3]) :- Lista \= [], 
   recorrido(a(E,Lista),Lista2), 
   recorridoAnchura(Lista2,Lista3).

/*
   recorrido(Arbol, Lista)
      Es cierto cuando Lista unifica con una lista de arboles
      que contiene el recorrido en anchura de la lista de arboles
      de Arbol
*/

recorrido(a(_,[]), []).
recorrido(a(_,[Cabeza|Resto]), R) :- 
   recorrido(Cabeza,Lista1), 
   recorrido(Resto,Lista2),
   append([Cabeza|Resto],Lista1,Lista3), 
   append(Lista3,Lista2,R).

recorrido([],[]).
recorrido([Cabeza|Resto], R):- 
   recorrido(Cabeza,Lista1), 
   recorrido(Resto,Lista2),
   append(Lista1,Lista2,R).


/* 
   recorridoAnchura(ListaArboles, ListaRaicesArboles)
      es cierto si ListaRaicesArboles unifica con una lista
      que contiene las raices de cada uno de  
      los arboles de la ListaArboles 
*/
recorridoAnchura([],[]).
recorridoAnchura([a(E,_)|Resto] , Lista2) :- 
   recorridoAnchura(Resto, Lista), 
   append([E],Lista,Lista2).


/*
   profundidad(+Arbol, -Lista)
      es ciero si Lista unifica con una lista 
      que contiene el recorrido en anchuura 
      del árbol generico Arbol
*/

/* predicado para arboles */
profundidad(a(E,[]), [E]).
profundidad(a(E,[Cabeza|Resto]), R) :- 
   recorrido(Cabeza,Lista1), 
   recorrido(Resto,Lista2), 
   append([E],Lista1,Lista3), 
   append(Lista3,Lista2,R).

/* predicado para listas */
profundidad([],[]).
profundidad([Cabeza|Resto], R):- 
   recorrido(Cabeza,Lista1), 
   recorrido(Resto,Lista2),
   append(Lista1,Lista2,R).

/*
   anchura(+Arbol, -Lista)
      es ciero si Lista unifica con una lista 
      que contiene el recorrido en anchuura 
      del árbol generico Arbol

             1        arbol2
		     / | \ 
          2  3  4
		   /|\    |
        5 6 7   8
*/

/* predicado para arbol */
anchura(a(E,[]),[E]).
anchura(a(E,Lista), [E|Lista2]) :- Lista \= [], anchura(Lista,Lista2).

/* predicado para lista */
anchura([a(E,Lista)|Resto], [E|Solucion2] ) :- append(Resto,Lista,Solucion1) , anchura(Solucion1,Solucion2).
anchura([],[]).

/*
   Si no muestra la solucion completa, tenemos que usar la función write(Lista).
*/

