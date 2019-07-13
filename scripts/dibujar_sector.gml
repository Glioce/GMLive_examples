///dibujar_sector( x,y,r, a1,a2,a3, contorno );
/*                 0 1 2  3  4  5   6
Autor: klm
Descripción: Dibuja un sector circular o "queso partido"
Versión: GM8 en adelante, también podría funcionar en versiones previas

DIBUJAR UN SECTOR CIRULAR
Dibuja un sector circular con vertice en (x,y), el vertice
es el centro del circulo, con radio r. El area dibujada va
desde el angulo 1 (a1) hasta el angulo 2 (a2), en el sentido
contrario a las manecillas del reloj, en incrementos iguales
al angulo 3 (a3). Si se intercambian los valores de a1 y a2
el sector resultante es el conjugado del primero.

Argumentos
   x,y: vertice del sector
   r: radio
   a1: angulo inicial
   a2: angulo final
   a3: angulo incremento (precision)
   contorno: dibujar solo contorno o llenar poligono
   
Devuelve: nada
*/
var xx, yy, r, a1, a2, a3;
xx = argument0; //vertice
yy = argument1;
r  = argument2; //radio

a1 = argument3; //angulo inicial
a2 = argument4; //angulo final
while( a1 > a2 ) a2 += 360; //evitar sectores mayores
while( a2-a1 > 360 ) a1 += 360; // a 360 grados

if( argument5 == 0 ) a3 = 10; //la precision debe
else a3 = abs(argument5); // ser mayor a cero

//iniciar primitivas (contorno o lleno)
if( argument6 ) draw_primitive_begin( pr_linestrip );
else draw_primitive_begin( pr_trianglefan );

draw_vertex( xx, yy ); //primer vertice
while( a2 >= a1 ) //hacer un barrido desde a2 hasta a1
{
    draw_vertex(
    xx + lengthdir_x(r,a2),
    yy + lengthdir_y(r,a2) );
    a2 -= a3;
}
draw_vertex( //vertice en a1
xx + lengthdir_x(r,a1),
yy + lengthdir_y(r,a1) );

if( argument6 ) draw_vertex( xx, yy ); //vertice final
draw_primitive_end();
