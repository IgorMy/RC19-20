# Resolución del problema de N-QUEENS (N Reinas) en prolog
:office: Universidad de Huelva (UHU)  
:calendar: Curso 2019-2020  
:mortar_board: Representación del conocimiento  
:octocat: Ihar Myshkevich
## Introducción
El presente documento desarrolla la implementación de la resolución del problema de N-Reinas en Prolog. Para su desarrollo se ha tomado el código del problema 90  (Eight queens problem) de P-99: Ninety-Nine Prolog Problems  de Werner Hett. En este código están presentes dos implementaciones que se comentaran por separado.  
## Problema de las N-Reinas
El problema de las N-Reinas es un problema de ajedrez en el que se colocan N reinas en un tablero de N^2 posiciones sin que ninguna amenace a otra. El tablero de ajedrez estándar es de 8^2 posiciones, permitiendo así la colocación de 8 reinas sin que estas amenacen unas a otras. Pero su resolución se puede aplicar a tableros más pequeños y más grandes. Siendo el tablero mínimo de 4^2 posiciones con 4 reinas y sin un limite establecido para el mas grande, aparte del tiempo de computo.
<p align="center">
  <img width="300" height="300" src="Imagenes/Reinas1.png">
</p>

## Predicados complementarios 
En este apartado se explicarán los predicados/declaraciones de los que se valen cada una de las implementaciones para resolver el problema.
### range( +A, +B, -L ) 
*Es cierto si L unifica con una lista que contiene número enteros consecutivos empezando en A y terminando en B.*  
Para el desarrollo de este predicado se ha usado la inducción matemática partiendo del caso base en el que la A y B son el mismo elemento. En cuyo caso L es una lista que contiene solo a A.  
En otros casos mientras A sea menor que B, se realizan llamadas recursivas a si misma con A incrementada en 1. En cuyo caso L es una lista que tiene en la cabeza a A y en la cola la L obtenida de la llamada recursiva.  
```
range(A,A,[A]).  
range(A,B,[A|L]) :-  A < B, A1 is A+1,  range(A1,B,L). 
```
```
?- range(1,5,L).  
L = [1, 2, 3, 4, 5].
```
### del( +A, +B, -C ) 
*Es cierto si C unifica con una lista que contiene a los elementos de B menos el elemento A.*  
Para el desarrollo de esta función se ha usado la inducción matemática partiendo del caso base en el que el primer elemento de B es A. En cuyo caso C es una lista con los elementos del resto de B.  
En otros casos realiza una llamada recursiva a si misma con el resto de B. En cuyo caso C es una lista que contiene en la cabeza la cabeza de B y en el resto la C obtenida de la llamada recursiva.  
