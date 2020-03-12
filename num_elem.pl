/*

num_elem(+Lista, -Num)
	es cierto si Num unifica con el número de elementos de la lista Lista

num_elem(?Lista, ?Num)


*/

num_elem([],0).
num_elem( [ Cabeza | Resto ] , N ) :- N2 is N-1, num_elem(Resto,N2).
