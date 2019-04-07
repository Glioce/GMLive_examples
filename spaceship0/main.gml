// Cargar sprites
spShip = sprite_add(
    "https://raw.githubusercontent.com/Glioce/GMLive_examples/master/spaceship0/spShip.png",
    1, true, false, 32, 32
);
spShipUp = sprite_add(
    "https://raw.githubusercontent.com/Glioce/GMLive_examples/master/spaceship0/spShipUp.png",
    3, true, false, 32, 32
);
spShipDown = sprite_add(
    "https://raw.githubusercontent.com/Glioce/GMLive_examples/master/spaceship0/spShipDown.png",
    3, true, false, 32, 32
);

// Create
inclinacion = 0; //angulo de inclinacion
sprite_index = spShip;
x = 100;
y = 100;
background_color = c_black;

#define scApproach
/// scApproach(valor, meta, incr);
//if( valor < meta )return min( valor + incr, meta );
//if( valor > meta )return max( valor - incr, meta );
if (argument0 < argument1) return min(argument0 + argument2, argument1);
if (argument0 > argument1) return max(argument0 - argument2, argument1);
return argument0;

#define step //Evento Step
kU = keyboard_check(vk_up); //tecla arriba
kD = keyboard_check(vk_down); //tecla abajo
kL = keyboard_check(vk_left); //tecla izquierda
kR = keyboard_check(vk_right); //tecla derecha

vx = (kR - kL) * 4; //velocidad horizontal
vy = (kD - kU) * 4; //velocidad vertical

x += vx; //desplazar
y += vy;

//si no se presionan las teclas, regresar a posicion horizontal
if (!kU and !kD) inclinacion = scApproach(inclinacion, 0, 3);

//si se presiona arriba o abajo, inclinar
if (kU) inclinacion = scApproach(inclinacion, 15, 3);
if (kD) inclinacion = scApproach(inclinacion, -15, 3);

//asignar sprite
if (inclinacion == 0) {
    sprite_index = spShip;
}
else if (inclinacion > 0) {
    sprite_index = spShipUp;
    image_index = inclinacion / 15;
}
else if (inclinacion < 0) {
    sprite_index = spShipDown;
    image_index = abs(inclinacion / 15);
}

#define draw //Evento Draw
draw_text(10, 10, inclinacion);
draw_self();
