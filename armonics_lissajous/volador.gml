/// Enemigo volador que sigue una trayectoria que
/// es una combinación de movimientos armónicos

// Create
room_speed = 60;

// posición del punto central
xx = random(500);
yy = random(500);

// constantes de la ecuación
v = 5; //velocidad del punto central
A = 50; //amplitud horizontal
B = 30; //amplitud vertical
t = 0;
dt = 0.1;

#define step
// seguir al puntero del ratón
a = point_direction(xx, yy, mouse_x, mouse_y);
if (point_distance(xx, yy, mouse_x, mouse_y) >= v) {
    xx += lengthdir_x(v, a);
    yy += lengthdir_y(v, a);
}

// desplazar objeto con movimientos armómicos
x = xx + A*sin(t);
y = yy + B*sin(2*t);
t += dt;
if (t > 2*pi) t -= 2*pi;

#define draw
draw_set_colour(c_white);
draw_circle(xx, yy, 8, true);

draw_set_colour(c_red);
draw_circle(x, y, 6, false);
