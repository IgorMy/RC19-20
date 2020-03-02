
% Natural

/*

1) natural(1)

2) natural(n-1) -> natural(n) (como implicación lógica, o regla lógica)
   natural(N) :- N>1,N2 is N - 1, natural(N2).

--------------------------------------------------------------------------

apropos(comando). (Ayuda de prolo)

+Numero (La variable no puede estar vacia)

?Numero (La variable puede estar vacia o no)

-Numero (La variable tiene que estar vacio)



*/


natural(1).
natural(N) :-N>1, N2 is N - 1, natural(N2).

