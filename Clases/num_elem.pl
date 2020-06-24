/*

num_elem(+Lista, -Num)
	es cierto si Num unifica con el número de elementos de la lista Lista

num_elem(?Lista, ?Num)


*/

num_elem([],0).
num_elem([_|Resto], Numero2) :- num_elem(Resto,Numero), Numero2 is Numero + 1.
