% 
% invertir(+Lista, -Resultado)
%   es cierto si Resultado unifica con una lista
%   que contiene los elementos de Lista en orden
%   inverso.

invertir([],[]).
invertir([Cabeza|Resto],Salida2 ) :- invertir(Resto,Salida) , append(Salida,[Cabeza],Salida2).
