/*

comprime(Lista, R).

comprime([1,1,1,2,2,3,3],R).

R = [(1,3),(2,2),(3,3)].

*/

/*
sum_elem([],N) :- N is 0.
sum_elem( [Cabeza | Resto], N) :- N2 is N + Cabeza, sum_elem(Resto,N2).
*/


comprime([],[]).
comprime( [E] , [(E,1)])