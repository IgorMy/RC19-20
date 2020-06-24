

/*
  bin2gen(+ArbolBinario, -ArbolGenerico)
  
  es cierto si ArbolGenerico unifica con un
  árbol genérico equivalente al árbol binario
  ArbolBinario.
  
  bin2gen(a(1,nil,nil), R).
  R=a(1,[])
  
  bin2gen(a(1,a(2,nil,nil), a(3,nil,nil)), R).
  R=a(1,[a(2,[]), a(3,[])]).
  
        1
       / \
      2   3 

*/

bin2gen(a(E,nil,nil), a(E,[])).

bin2gen(a(E,Arbol1,Arbol2), a(E,[Resultado1,Resultado2])) :- 
      Arbol1 \= nil, 
      Arbol2 \= nil, 
      bin2gen(Arbol1,Resultado1),
      bin2gen(Arbol2,Resultado2).

bin2gen(a(E,nil,Arbol2), a(E,[Resultado2])) :- 
      Arbol2 \= nil, 
      bin2gen(Arbol2,Resultado2).

bin2gen(a(E,Arbol1,nil), a(E,[Resultado1])) :- 
      Arbol1 \= nil, 
      bin2gen(Arbol1,Resultado1).