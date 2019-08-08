/******************************************************
En este ejemplo se muestra cómo obtener objetos
aleatorios de una lista y dibujarlos en una cuadrícula
*************************************************** **/

// Create
randomize();

saco = ds_list_create(); //crear lista
repeat(5) ds_list_add(saco, obj_1); //agregar obj1
repeat(5) ds_list_add(saco, obj_2); //agregar obj2
repeat(5) ds_list_add(saco, obj_3); //agregar obj2
ds_list_shuffle(saco); //desordenar

size = ds_list_size(saco); //tamaño de la lista
for(i=0; i<size; i++){ //crear instancias
    x = (i mod 4) * 32;
    y = (i div 4) * 32;
    instance_create(x, y, saco[|i]);
}
ds_list_clear(saco); //limpiar lista

#define draw
// Dibujar las instancias
draw_set_color(c_fuchsia);
with(obj_1) draw_rectangle(x, y, x+30, y+30, false);

draw_set_color(c_aqua);
with(obj_2) draw_rectangle(x, y, x+30, y+30, false);

draw_set_color(c_yellow);
with(obj_3) draw_rectangle(x, y, x+30, y+30, false);
