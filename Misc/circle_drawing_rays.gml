// create
ox = 250; //offset
oy = 250;
x = 0; //posición
y = 0;
direction = 0;
pos = 0;
incre = 1;
sf = surface_create(room_width, room_height);

#define step
// Mover robot
jx = keyboard_check(vk_left) - keyboard_check(vk_right);
jy = keyboard_check(vk_up) - keyboard_check(vk_down);
direction += jx;
x += lengthdir_x(1, direction) * jy;
y += lengthdir_y(1, direction) * jy;

//Rotar rayo de visión
pos += incre;
if (pos <= 0 or pos >= 180) incre *= -1;

if not surface_exists(sf) sf = surface_create(room_width, room_height);

surface_set_target(sf);
draw_set_color(c_blue);
dist = random_range(50, 100);
ang = direction + pos - 90;
draw_line(x + ox, y + oy,
x + ox + lengthdir_x(dist, ang),
y + oy + lengthdir_y(dist, ang));
surface_reset_target();


#define draw
draw_surface(sf, 0, 0);

draw_set_color(c_white);
draw_circle(x + ox, y + oy, 10, false);

draw_set_color(c_red);
draw_circle(x + ox + lengthdir_x(5, direction), 
y + oy + lengthdir_y(5, direction), 5, false);
