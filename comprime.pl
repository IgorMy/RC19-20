
/* 
    comprime(+Lista, -R)
    es cierto si R unifica con una lista de la siguiente 
    forma:

    comprime([1,1,1,2,2,2,3,4,4],R).
    R = [(1,3), (2,3), (3,1), (4,2)]
*/

comprime( [] , [] ).

comprime( [E] , [(E,1)] ).

comprime( [Cabeza,Cabeza|Resto], [(Cabeza,Numero2)|R] ) :- 
    comprime( [Cabeza|Resto] , [ (Cabeza,Numero) | R] ),
    Numero2 is Numero + 1. 


comprime( [Cabeza1,Cabeza2|Resto],[(Cabeza1,1)|R]) :- 
    Cabeza1 \= Cabeza2, 
    comprime( [Cabeza2|Resto],R).
    