// Algoritmo Wavefront para búsqueda de ruta v01
// Primero se usa el algoritmo BSF
// Usaremos 4 vecinos --> no hay rutas en diagonal

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

// crear matrices
M_nodos = ds_grid_create(cols, rows); //matriz de nodos
M_obs = ds_grid_create(cols, rows); //matriz de obstáculos
M_vis = ds_grid_create(cols, rows); //matriz de nodos visitados

// arrays con posiciones relativas de los nodos vecinos
arrX[0] = 1; //derecha
arrY[0] = 0;
arrX[1] = 0; //arriba
arrY[1] = -1;
arrX[2] = -1; //izquierda
arrY[2] = 0;
arrX[3] = 0; //abajo
arrY[3] = 1;

// agregar obstáculos aleatorios
for (i = 0; i < cols; i++)
for (j = 0; j < rows; j++) {
    //true (1) significa que es obstáculo
    //false (0) significa que no es obstácul
    o = random(100) < 20; //
    ds_grid_set(M_obs, i, j, o); //insertar valor en la matriz
}

// inicializar BSF
ds_grid_clear(M_nodos, -1); //llenar con -1 que significa distancia infinita
//indicar nodos/celdas visitadas, las que tienen obstáculos no se pueden visitar
ds_grid_copy(M_vis, M_obs);

// el nodo en posición (9, 9) es el inicio de BSF y la meta de wavefront
// el robot inicia en (0, 0)
xInicio = 0;
yInicio = 0;
xMeta = 9;
yMeta = 9;
xRuta = -1;
yRuta = -1;
ds_grid_set(M_nodos, xMeta, yMeta, 0); //este nodo tiene distancia cero
ds_grid_set(M_obs, xMeta, yMeta, 0); //borrar obstacúlo
ds_grid_set(M_vis, xMeta, yMeta, 1); //nodo inicial visitado

Q_wave = ds_queue_create(); //crear cola
ds_queue_enqueue(Q_wave, xMeta, yMeta); //agregar nodo a la cola

//el nodo en pos. (0, 0) es el final de BSF, el inicio
//de wavefront y posición inical del robot
ds_grid_set(M_obs, xInicio, yInicio, 0); //borrar obstacúlo
ds_grid_set(M_vis, xInicio, yInicio, 0); //no visitado

// esta lista contiene las coordenadas de la trayectoria/ruta
ruta = path_add();
path_set_closed(ruta, false);

#define draw

if (estado == 0) {//Algoritmo BSF
    if !ds_queue_empty(Q_wave)
    {
        //extraer celda/nodo
        x = ds_queue_dequeue(Q_wave);
        y = ds_queue_dequeue(Q_wave);
        distancia = ds_grid_get(M_nodos, x, y);
        
        //examinar celdas/nodos adyacentes
        for (i=0; i<4; i+=1) {
            xx = x + arrX[i];
            yy = y + arrY[i];
            if celda_valida(xx, yy) {
                ds_grid_set( M_vis, xx, yy, 1); //marcar como visitado
                ds_grid_set( M_nodos, xx, yy, distancia + 1); //asignar dist.
                ds_queue_enqueue(Q_wave, xx, yy); //encolar
            }
        }
    }
    else {
        estado = 1; //ahora hacer recorrido
        xRuta = xInicio; //comenzamos el recorrido en este nodo
        yRuta = yInicio;
        path_add_point(ruta, xRuta*w + w2, yRuta*h + h2, 0);
        ds_grid_copy(M_vis, M_obs);
    }
}
else if(estado == 1) {//recorrido de inicio a meta
    distancia = ds_grid_get(M_nodos, xRuta, yRuta);
    //examinar celdas/nodos adyacentes
    for (i=0; i<4; i+=1) {
        xx = xRuta + arrX[i];
        yy = yRuta + arrY[i];
        if celda_valida(xx, yy) {
            d = ds_grid_get(M_nodos, xx, yy);
            if (d < distancia and d != -1) {
                xRuta = xx;
                yRuta = yy;
                path_add_point(ruta, xRuta*w + w2, yRuta*h + h2, 0);
                break;
            }
        }
    }
}

// dibujar celdas
//draw_set_colour(c_white);
for (i = 0; i < cols; i++)
for (j = 0; j < rows; j++) {
    x = i * w;
    y = j * h;
    o = ds_grid_get(M_obs, i, j); //valor de la celda
    //si no es obstáculo, dibujar cuadro blanco
    //en caso contrario, dibujar cuadro gris
    if (o == 0) draw_set_colour(c_white);
    else draw_set_colour(c_gray);
    draw_rectangle(x, y, x+w-2, y+h-2, false);
}

// dibujar distancias
draw_set_colour(c_black);
for (i = 0; i < cols; i++)
for (j = 0; j < rows; j++) {
    x = i * w;
    y = j * h;
    distancia = ds_grid_get(M_nodos, i, j);
    draw_text(x, y, distancia);
}

//dibujar ruta
draw_set_colour(c_red);
draw_path(ruta, 0, 0, true);

#define celda_valida
/// celda_valida(x, y);
// Una celda es valida si no esta fuera de la matriz, 
//no esta ocupada por un ostaculo y no ha sido visitada.

return
(argument0 >=0 and argument0 < cols) and
(argument1 >=0 and argument1 < rows) and
(ds_grid_get(M_vis, argument0, argument1) == 0);
