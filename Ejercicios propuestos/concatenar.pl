% Concatenar dos listas en Prolog 
%
% concatenar (+Lista1, +Lista2, - Resultado)
%   es cierto si Resultado contiene los
%   elementos de Lista1 seguidos de los
%   elementos de Lista2 en el mismo orden.

concatenar([],Lista2,Lista2).
concatenar([Cabeza|Resto],Lista2, [Cabeza|R] ) :- concatenar(Resto,Lista2,R).