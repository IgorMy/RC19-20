/* 
	ord_inser(+Lista, -R)
	es cierto si R unifica con una lista
	que contiene los elementos de Lista
	ordenados de menor a mayor.

	[8,4,5,2,7,1]
	[8]
	
	[8,4,5,2,7,1]
	[4,8]
	
	[8,4,5,2,7,1]
	[4,5,8]
	
*/

ord_inser([],[]).

ord_inser([Cab|Resto], R2) :- ord_inser(Resto, R), inser_lista_ord(Cab,R,R2).

/*
	insertar_lista_ord(+E,+Lista,-R)
	Es cierto si R unifica ocn una lista que contiene
	los elementos de lista (lista ordenada)
	con E insertado en su posición correcta
*/

inser_lista_ord(N,[],[N]).

inser_lista_ord(N,[Cab | Resto], [Cab|R2]) :- N > Cab, inser_lista_ord(N,Resto,R2). 

inser_lista_ord(N, [Cab|Resto], [N,Cab|Resto]) :- N =< Cab. 


/*
	my_quicksort(Lista,R)
	es cierto si R unifica con una lista
	que contiene los elementos de Lista 
	ordenados de menor a mayor del metodo
	de quiksort
	
	[9,4,6,2,6,3,1,4,2]
	
		pivote = 4 O(n)
		
	[4,2,3,1,4,2] [9,6,6]
	
	quicksort(4,2,3,1,4,2],R1).
	quicksort([9,6,6], R2).
	
	R1 = [1,2,2,3,4,4].
	R2 = [6,6,9].
	
*/

my_quicksort([],[]).

my_quicksort([Cab|Resto], R) :- 
menores_o_iguales(Resto, Cab, Men),
mayores(Resto,Cab,May),
my_quicksort(Men,Rme),
my_quicksort(May, Rma),
append(Rme,[Cab|Rma],R).

/*
	menores_o_iguales(Lista,P,R)
	Es cierto si R unifica con la lista
	de valores de Lista que son menores_o_iguales
	que P.
*/

menores_o_iguales([],_,[]).

menores_o_iguales([Cabeza|Resto], N , [Cabeza|R]) :- 
Cabeza =< N,
menores_o_iguales(Resto,N,R).

menores_o_iguales([Cabeza|Resto], N ,R) :- 
Cabeza > N,
menores_o_iguales(Resto,N,R).

/*
	mayores(Lista,P,R)
	Es cierto si R unifica con la lista
	de valores de Lista que son mayores que P.
*/

mayores([],_,[]).

mayores([Cabeza|Resto], N , [Cabeza|R]) :- 
Cabeza > N,
mayores(Resto,N,R).

mayores([Cabeza|Resto], N ,R) :- 
Cabeza =< N,
mayores(Resto,N,R).

