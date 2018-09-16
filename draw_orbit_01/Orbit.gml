/// Create Event
// Planet
x = random_range(200, 300);
y = random_range(200, 300);
r = 50; //radius
g = 100; //gravity at distance 1

// Bullet
bx = random_range(100, 400);
by = random_range(100, 400);
br = 4; //raduis
vi = random_range(0.1, 0.8); //initial velocity
di = random(360); //initial direction

#define draw /// Draw Event

// Draw planet
draw_set_color(c_blue);
draw_rectangle(200,200, 300,300, true);
draw_circle(x, y, r, false);

// Draw bullet
draw_set_color(c_red);
draw_rectangle(100,100, 400,400, true);
draw_circle(bx, by, br, false);

// Draw orbit
draw_set_color(c_white);
draw_orbit(x,y,g, bx,by,vi,di);

draw_text(0,0, "FPS: "+string(fps));


#define point_dist_sqr // script

// point distance squared
return sqr(argument0 - argument2) + sqr(argument1 - argument3);


#define draw_orbit // script

// Arguments
var px = argument0; //planet x
var py = argument1; //planet y
var pg = argument2; //planet gravity

var bx = argument3; //bullet x
var by = argument4; //bullet y
var bv = argument5; //initial speed
var bd = argument6; //initial direction

var bvx = lengthdir_x(bv, bd);
var bvy = lengthdir_y(bv, bd);
var bg, bgd; //gravity and gravity direction for bullet

draw_primitive_begin(pr_linestrip);
repeat(500) {
    draw_vertex(bx,by); //bullet position
    bx += bvx; //move bullet
    by += bvy;
    bg = pg / point_dist_sqr(px,py, bx,by); //update gravity
    bgd = point_direction(bx,by, px,py); //update gravity direction
    bvx += lengthdir_x(bg, bgd); //update speed
    bvy += lengthdir_y(bg, bgd);
}
draw_primitive_end();