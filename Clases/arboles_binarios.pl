
/*
    Arboles Binarios

    nil
    a(Etiqueta, HijoIzquierda, HijoDerecha)

        1
       / \
      2   3

    a(1,a(2,nil,nil),a(3,nil,nil)).
*/

arbol1(a(1,a(2,nil,nil),a(3,nil,nil))).

arbol2(a(1,a(2,a(4,nil,nil),a(5,nil,nil)),a(3,a(6,nil,nil),a(7,nil,nil)))).

/*
pertenece(E,Arbol)
    es cierto si la etiqueta E pertenece al 
    árbol binario Arbol
*/

% pertenece(_,nil). si es falso no se escribe

pertenece(E,a(E,_,_)).

pertenece(E,a(Et,Hi,_)) :-
    E \= Et,
    pertenece(E,Hi). 

pertenece(E,a(Et,_,Hd)) :-
    E \= Et,
    pertenece(E,Hd).


/*
    hojas(Arbol, Lista)
    es cuierto si Lista unifica con
    una lista que contiene todas las hojas
    del árbol
*/


% 1. los dos nulos
% 2. dos árboles no nulos
% 3. Hi nulo derecha no nulo
% 3. Hd nulo izquierda no nulo

hojas(nil,[]).

hojas(a(E,nil,nil),[E]).

hojas(a(_,Hi,Hd) , Solucion) :-
    Hi \= nil, Hd \= nil,
    hojas(Hi,Ri),
    hojas(Hd,Rd),
    append(Ri,Rd,Solucion).

hojas(a(_,nil,Hd), Rd):- Hd \= nil, hojas(Hd,Rd).

hojas(a(_,Hi,nil), Ri):- Hi \= nil, hojas(Hi,Ri).


/*

            +
           / \
          *   /
         / \ / \
        4  5 6  7
*/

arbol3(a('+',a('*',a(4,nil,nil),a(5,nil,nil)),a('/',a(6,nil,nil),a(7,nil,nil)))).


% preorden
% raiz,hi,Hd

preorden(nil,[]).

preorden(a(E,Hi,Hd) , Solucion) :-
    preorden(Hi,Ri),
    preorden(Hd,Rd),
    append([E|Ri],Rd,Solucion).

% posorden
% hi,hd,raiz

posorden(nil,[]).

posorden(a(E,Hi,Hd) , Solucion1) :-
    posorden(Hi,Ri),
    posorden(Hd,Rd),
    append(Ri,Rd,Solucion),
    append(Solucion,[E],Solucion1).

% inorden
% hi,raiz,hd

inorden(nil,[]).

inorden(a(E,Hi,Hd) , Solucion) :-
    inorden(Hi,Ri),
    inorden(Hd,Rd),
    append(Ri,[E|Rd],Solucion).

/*
    buscar_abb(E, ABB)
        es cierto si el elemento E pertenece al
        árbol binario de búsqueda ABB
*/

buscar_abb(E, a(E, _, _)).

buscar_abb(E, a(Raiz, HI, _)) :-
    E < Raiz,
    buscar_abb(E,HI).

buscar_abb(E, a(Raiz, _, HD)) :-
    E > Raiz,
    buscar_abb(E,HD).

/*
                9
            /       \
        5               12       
   /        \           /\
3               7   10      15
*/

arbol4(a(9,a(5,a(3,nil,nil),a(7,nil,nil)),a(12,a(10,nil,nil),a(15,nil,nil)))).

/*
    crear_arbol(+Lista, +Arbol)
    es cierto si Arbol unifica con el árbol
    binario que contiene los elementos
    de Lista
*/

crear_arbol([],nil).
crear_arbol([Cabeza|Resto], a(Cabeza, R, nil) ) :- crear_arbol(Resto,R).

/*
    balanceado(+Arbol)
        es cierto si Arbol es un árbol binario
        balanceado. Para todo nodo, la diferencia
        entre la altura del árbol derecho y el árbol izquierdo es como máximo 1.
*/

balanceado(nil).
balanceado(a(_, HI, HD)) :-
    altura(HI,AI),
    altura(HD,AD),
    X is abs(AI-AD),
    1 is max(1,X),
    balanceado(HI),
    balanceado(HD).


/*
    altura(+A, -R)
        es cierto si R unifica con la
        altura del arbol A.
*/

altura(nil,0).
altura(a(_, HI, HD), R2  ):-
    altura(HI,RI),
    altura(HD,RD),
    R is max(RI,RD),
    R2 is 1 + R.

/*
    crea_balanceado(+Lista, -Arbol)
        es cierto si Arbol unifica con una 
        árbol balanceado que contiene
        todos los elementos de Lista.
*/

crear_balanceado([],nil).

crear_balanceado([ Cabeza | Resto ], a(Cabeza,R1,R2)):-
    length(Resto,Length),
    Med is Length div 2,
    length(L1,Med),
    append(L1,L2,Resto),
    crear_balanceado(L1,R1),
    crear_balanceado(L2,R2).

/*
    crea_abb(+Lista, -ABB)
        es cierto si ABB unifica con Lista
        y contiene todos lo elementos ordenados
    Suponemos que lista esta ordenado de menor a mayor
*/

crear_abb([],nil).

crear_abb(Lista, a(M,R1,R2)):-
    length(Lista,Length),
    Med is Length div 2,
    length(L1,Med),
    append(L1,[M|L2],Lista),
    crear_abb(L1,R1),
    crear_abb(L2,R2).
