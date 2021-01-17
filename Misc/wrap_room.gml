// Ejemplo "Envolver la room".
// Salir por un lado y aparecer por el lado contrario

// Evento Create =========================
room_speed = 60;

// ver tamaño de la room
show_debug_message(room_width);
show_debug_message(room_height);

// asignar sprite y escala
sprite_set_offset(spr_white16, 8, 8);
sprite_index = spr_white16;
image_xscale = 2;
image_yscale = 2;

// iniciar en el centro de la room
x = room_width / 2;
y = room_height / 2;

// valor de offset para salir de la room
offset = 16;

#define step // Evento Step ===============

// mover personaje
ejeX = keyboard_check(vk_right) - keyboard_check(vk_left);
ejeY = keyboard_check(vk_down) - keyboard_check(vk_up);
hspeed = ejeX * 3;
vspeed = ejeY * 3;

if (x < offset) x += room_width + (offset * 2);
if (x > room_width + offset) x -= room_width + (offset * 2);
if (y < offset) y += room_height + (offset * 2);
if (y > room_height + offset) y -= room_height + (offset * 2);


#define draw // Evento Draw ================

// dibujar personaje
draw_self();

// dibujar borde de la room
draw_rectangle(0, 0, room_width, room_height, true);
