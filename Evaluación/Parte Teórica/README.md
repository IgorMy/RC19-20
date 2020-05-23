# Técnicas de Representación del Conocimiento 
:office: Universidad de Huelva (UHU)  
:calendar: Curso 2019-2020  
:mortar_board: Representación del conocimiento  
:octocat: Ihar Myshkevich  
## Introducción  
En el presente documento se detallan las diferentes técnicas mas usadas en la representación del conocimiento aplicadas al área de la inteligencia artificial. 
Estas son utilizadas para transformar la información del mundo real en una estructura especifica para que la IA pueda resolver problemas en base a ella. 
Actualmente se pueden destacar cuatro. 
## Lógica
La representación del conocimiento usando la lógica consiste un lenguaje con representación inequívoca guiada por condiciones y reglas. Sus características principales son:  
* No presenta ambigüedad en su representación, pero si es susceptible a errores externos. 
* Permite una comunicación y procesamiento sin ambigüedad.
* Muy diferente a los leguajes naturales como el inglés o el español.

Como cualquier lengua, presenta una sintaxis y una semántica bien definida que permite traducir cualquier oración a la lógica.
```
Lenguaje Natural: “Todas las rosas tienen espinas” 
Lógica: ∀𝑋.(𝑟𝑜𝑠𝑎(𝑋) → ∃𝑌.(𝑡𝑖𝑒𝑛𝑒(𝑋,𝑌) ∧ 𝑒𝑠𝑝𝑖𝑛𝑎𝑠(𝑌))) 
   Para toda X: 
      Si (X es una rosa)
      Entonces existe un Y tal que
        (X tiene Y) y (Y son espinas) 
```


### Ventajas
* La representación lógica ayuda a realizar el razonamiento lógico.
* Esta representación es la base de los lenguajes de programación. 

### Desventajas
* Las representaciones lógicas tienen algunas restricciones y son difíciles de trabajar.
* Esta técnica puede no ser muy natural, y la inferencia puede no ser muy eficiente.

## Redes semánticas
Las redes semánticas son una forma de representar el conocimiento basada en grafos. Estos constan de nodos que representan el objeto y arcos que describen la relación entre esos objetos. En el caso de que el grafo no presente ciclos, se puede visualizar como un árbol. Se usan principalmente para representar mapas conceptuales y mentales. 

