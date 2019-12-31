# GIA 01 - Carrera de Droides
Esta competencia se realizó por pirmera vez a finales de 2008. Esta es la segunda edición realizada a principios de 2020.
La  IA controlar un personaje plataformero que debe llegar a la meta.

## Ideas para la programación
La primera parte es implementar el algoritmo A* para encontrar el camino más corto.
El resultado se va a modificar o se va a utilizar una heurística especial para que el camino esté pegado 
al piso y se eliminen las rutas con movimientos imposibles de realizar. Los movimientos imposibles son:

+ Saltos muy largos (por ejemplo saltar sobre muchos obstáculos y enemigos)
+ Saltos muy altos (pararse sobre una plataforma que es imposble de alcanzar)
+ Avanzar muy rápido
+ Moverse horizontalmente sobre un precipicio

Al obtener el camino con A*, la IA siempre sabe hacia dónde caminar
**¿Cómo eliminar los nodos que ya se alcanzaron?**
Cuando el personaje sigue los nodos en la ruta indicada, los nodos alcanzados se eliminan
si el personaje se encuentra a distancia corta o colisiona con los nodos.

Los movmientos precisos en cada zona se realizan con la verdadera IA. La IA puede ser de dos formas:

1. **Red neuronal.** La red toma como entrada un conjunto de bloques alrededor del personaje y 
tiene como salida las 3 acciones posibles (moverse a la izquierda, moverse a la derecha y saltar).

2. **IA discreta.** Esta IA tiene reglas simples y se basan en detectar colisiones y alcanzar bloques específicos.
Puede ser más difícil de programar, pero más eficiente.

Se usará una IA discreta.

El personaje sigue el siguiente nodo en la ruta:
+ si el nodo está a la izquierda, camina a la izquierda
+ si el nodo está a la derecha, camina a la derecha
+ si el nodo está abajo y a un lado, sigue caminando
+ si el nodo está justo abajo, deja de caminar y cae
+ si el nodo está arriba, salta (es mejor si salta cuando está a la distancia correcta)
+ si el nodo está justo arriba, deja de caminar y salta
+ si hay un enemigo o pincho a un lado, deja de caminar para no colisionar

El nodo se considera alcanzado cuando la distancia con el personaje es menor a un valor determinado
o cuando el personaje colisiona con el que rodea al nodo.

## Investigación
Programar A*  
https://www.youtube.com/watch?v=aKYlikFAV4k
https://en.wikipedia.org/wiki/A*_search_algorithm

A* modificado para juego de plataformas  
Serie: https://gamedevelopment.tutsplus.com/series/how-to-adapt-a-pathfinding-to-a-2d-grid-based-platformer--cms-882  
Teoría: https://gamedevelopment.tutsplus.com/tutorials/how-to-adapt-a-pathfinding-to-a-2d-grid-based-platformer-theory--cms-24662  

https://gamedev.stackexchange.com/questions/118912/how-can-i-adapt-a-pathfinding-to-work-with-platformers  
https://www.gamasutra.com/blogs/YoannPignole/20150427/241995/The_Hobbyist_Coder_3__2D_platformers_pathfinding__part_12.php  
https://www.gamedev.net/articles/programming/artificial-intelligence/generalized-platformer-ai-pathfinding-r3924/  
https://www.gamedev.net/forums/topic/663166-an-easy-approach-to-platformer-pathfinding/

Puede servir  
https://zackbellgames.com/2015/02/15/pathfinding-pt-1/  
https://zackbellgames.com/2015/02/16/pathfinding-pt-2/  
https://zackbellgames.com/2015/10/02/faraway-dynamic-way-point-trails/  
