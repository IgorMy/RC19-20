% 
% invertir(+Lista, -Resultado)
%   es cierto si Resultado unifica con una lista
%   que contiene los elementos de Lista en orden
%   inverso.

invertir([],[]).
invertir([Cab|Resto],R2) :- invertir(Resto,R), append(R, [Cab], R2).
