# GIA 01 - Carrera de Droides
Esta competencia se realizó por pirmera vez a finales de 2008. Esta es la segunda edición realizada a principios de 2020.
La  IA controlar un personaje plataformero que debe llegar a la meta.

# Ideas para la programación
La primera parte es implementar el algoritmo A* para encontrar el camino más corto.
El resultado se va a modificar o se va a utilizar una heurística especial para que el camino esté pegado 
al piso y se eliminen las rutas con movimientos imposibles de realizar. Los movimientos imposibles son:

+ Saltos muy largos (por ejemplo saltar sobre muchos obstáculos y enemigos)
+ Saltos muy altos (pararse sobre una plataforma que es imposble de alcanzar)
+ Avanzar muy rápido

Al obtener el camino con A*, la IA siempre sabe hacia dónde caminar
**¿Cómo eliminar los nodos que ya se alcanzaron?**

Los movmientos precisos en cada zona se realizan con la verdadera IA. La IA puede ser de dos formas:

1. **Red neuronal.** La red toma como entrada un conjunto de bloques alrededor del personaje y 
tiene como salida las 3 acciones posibles (moverse a la izquierda, moverse a la derecha y saltar).

2. **IA discreta.** Esta IA tiene reglas simples y se basan en detectar colisiones y alcanzar bloques específicos.
Puede ser más difícil de programar, pero más eficiente.

## Investigación
Programar A*  
https://www.youtube.com/watch?v=aKYlikFAV4k

Puede servir  
https://zackbellgames.com/2015/02/15/pathfinding-pt-1/  
https://zackbellgames.com/2015/02/16/pathfinding-pt-2/  
https://zackbellgames.com/2015/10/02/faraway-dynamic-way-point-trails/  
