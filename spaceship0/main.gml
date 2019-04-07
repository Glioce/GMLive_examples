// Create
inclinacion = 0; //angulo de inclinacion

#define scApproach
/// scApproach(valor, meta, incr);
//if( valor < meta )return min( valor + incr, meta );
//if( valor > meta )return max( valor - incr, meta );

if (argument0 < argument1) return min(argument0 + argument2, argument1);
if (argument0 > argument1) return max(argument0 - argument2, argument1);
return argument0;

#define step
kU = keyboard_check(vk_up); //tecla arriba
kD = keyboard_check(vk_down); //tecla abajo

//si no se presionan las teclas, regresar a posicion horizontal
if (!kU and !kD) inclinacion = scApproach(inclinacion, 0, 5);

//si se presiona arriba o abajo, inclinar
if (kU) inclinacion = scApproach(inclinacion, 20, 5);
if (kD) inclinacion = scApproach(inclinacion, -20, 5);

#define draw
draw_text(10, 10, inclinacion)
draw_line(10, 50, 10+lengthdir_x(50, inclinacion), 50+lengthdir_y(50, inclinacion))
