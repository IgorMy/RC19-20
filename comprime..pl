comprime([], []).
comprime([E], [(E,1)]).
comprime([H, H|Tail], [(E,N2)|R]):- comprime([H|Tail], [(E,N)|R]), N2 is N+1.
comprime([H1, H2|Tail], [(H1,1)|R]):- H1 \= H2, comprime([H2|Tail], R).