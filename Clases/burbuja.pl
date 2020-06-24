/* 
  burbuja(+Lista, -R)
  es cierto si R unifica con una lista 
  que contienen los elementos de Lista ordenados
  de menor a mayor utilizando el método de burbuja.
  En este caso, construimos la inducción no por el 
  tamaño de la lista, sino ordenando en cada 
  paso la lista un poco más.
*/

burbuja(Lista, R2):-
  append(Lista1, [E1, E2|Lista2], Lista),
  E1 > E2,
  append(Lista1, [E2,E1|Lista2], R),
  burbuja(R, R2).

burbuja(Lista, Lista):- ordenada(Lista).

/*
 ordenada(+Lista)
 es cierto si los elementos de Lista están
 ordenados de menor a mayor.
*/

ordenada([]).
ordenada([_]).
ordenada([Cabeza1,Cabeza2|Resto]) :- Cabeza1 =< Cabeza2,ordenada([Cabeza2|Resto]). 