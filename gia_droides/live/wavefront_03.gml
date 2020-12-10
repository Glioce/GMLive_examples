// Algoritmo Wavefront para búsqueda de ruta v0.3
// Primero se usa el algoritmo BSF
// Usaremos 4 vecinos --> no hay rutas en diagonal
// Cada nodo es una instancia de obj_1
// Ahora los nodos tienen una variable "padre" para guardar
// el nodo anterior en el llenado con BSF

// Setup
room_speed = 30; //cuadros por segundo de la animación
cols = 10; //número de columnas
rows = 10; //número de filas
w = 42; //anchura de la celda (px)
h = 42; //altura de la celda (px)
w2 = w/2; //mitad de la anchura
h2 = h/2; //mitad de la altura
estado = 0;
// 0: realizar BSF
// 1: recorrido de inicio a meta
// 2: finalizado

// arrays con posiciones relativas de los nodos vecinos
arrX[0] = 1; //derecha
arrY[0] = 0;
arrX[1] = 0; //arriba
arrY[1] = -1;
arrX[2] = -1; //izquierda
arrY[2] = 0;
arrX[3] = 0; //abajo
arrY[3] = 1;

// crear matrices de nodos (grafo) y agregar nodos
M = ds_grid_create(cols, rows);
for (i = 0; i < cols; i++)
for (j = 0; j < rows; j++) {
    nodo = instance_create(i, j, obj_1);
    nodo.dis = -1; //significa distancia infinita
    nodo.vis = false; //no ha sido visitado
    nodo.obs = random(100) < 20; //obstaculo
    //true (1) significa que es obstáculo
    //false (0) significa que no es obstáculo
    nodo.padre = -1; //ninguno por ahora
    ds_grid_set(M, i, j, nodo); //agregar a la matriz
}
//trace(ds_grid_get(M, -1, 0));

// elegir nodos inicio y meta
inicio = ds_grid_get(M, 0, 0);
meta = ds_grid_get(M, 9, 9);

// quitar obstaculos de inicio y meta
inicio.obs = false;
meta.obs = false;

// preparar nodo meta para BFS
meta.dis = 0; //este nodo tiene distancia cero
meta.vis = true; //nodo visitado

Q = ds_queue_create(); //crear cola
ds_queue_enqueue(Q, meta); //agregar nodo a la cola

// esta lista contiene las coordenadas de la trayectoria/ruta
ruta = path_add();
path_set_closed(ruta, false);
nodo = noone;

#define draw //loop

if (estado == 0) {//Algoritmo BSF
    if !ds_queue_empty(Q)
    {
        //extraer celda/nodo
        nodo = ds_queue_dequeue(Q);
        
        //examinar celdas/nodos adyacentes
        for (i=0; i<4; i+=1) {
            x = nodo.x + arrX[i]; //coordenadas de un nodo ajyacente
            y = nodo.y + arrY[i];
            n = ds_grid_get(M, x, y);
            
            if celda_valida(n) {
                n.vis = true; //marcar como visitado
                n.dis = nodo.dis + 1; //asignar dist.
                n.padre = nodo; //asignar padre
                ds_queue_enqueue(Q, n); //encolar
            }
        }
    }
    else {
        //room_speed = 10;
        estado = 1; //ahora hacer recorrido
        nodo = inicio; //comenzamos el recorrido en este nodo
        path_add_point(ruta, nodo.x*w + w2, nodo.y*h + h2, 0);
    }
}
else if(estado == 1) {//recorrido de inicio a meta
    if (nodo.padre > -1) {
        nodo = nodo.padre;
        path_add_point(ruta, nodo.x*w + w2, nodo.y*h + h2, 0);
    }
    else estado = 2;
}

// dibujar celdas
//draw_set_colour(c_white);
for (i = 0; i < cols; i++)
for (j = 0; j < rows; j++) {
    x = i * w;
    y = j * h;
    //si no es obstáculo, dibujar cuadro blanco
    //en caso contrario, dibujar cuadro gris
    if (ds_grid_get(M, i, j).obs == false) draw_set_colour(c_white);
    else draw_set_colour(c_gray);
    draw_rectangle(x, y, x+w-2, y+h-2, false);
}

// dibujar distancias
draw_set_colour(c_black);
for (i = 0; i < cols; i++)
for (j = 0; j < rows; j++) {
    x = i * w;
    y = j * h;
    draw_text(x, y, ds_grid_get(M, i, j).dis);
}

//dibujar ruta
draw_set_colour(c_red);
draw_path(ruta, 0, 0, true);


#define celda_valida
/// celda_valida(nodo);
// Una celda es valida si no esta fuera de la matriz, 
//no esta ocupada por un ostaculo y no ha sido visitada.

if (argument0 == undefined) return false;

return
(argument0.x >=0 and argument0.x < cols) and
(argument0.y >=0 and argument0.y < rows) and
(argument0.vis == false) and (argument0.obs == false);

