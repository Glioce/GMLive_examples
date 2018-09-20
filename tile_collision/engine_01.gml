screen_width = 320;
screen_height = 240;

b2 = 0;
s = 0;
d = 1;
hv = 0;
for (i=0; i<2; i+=1)
{
    tile_x[i] = 0;
    tile_y[i] = 0;
    tile_x2[i] = tile_x[i] + 16;
    tile_y2[i] = tile_y[i] + 16;
}

bg = background_add(
    "https://raw.githubusercontent.com/Glioce/GMLive_examples/master/tile_collision/platform1.bmp",
    1, 0
);
background_index[0] = bg;

//t = 100*room_speed + current_time;
//while (current_time < t) {}

nnn = tile_add(bg, 16,16,16,16, 100, 100, 0);
nnn2 = tile_add(bg, 16,16,16,16, 100, 120, 0);

//informacion sobre las variables
//b2: variable que indica que la flecha arriba es presionada
//s: variable de salto
//d: variable de direccion
//tile_x, posicion x de la tile
//tile_x2, posicion segunda de la tile
//tile_y; posicion y de la tile
//tile_y2 posicion segunda de la tile
//background_add para agregar la imagen con las tiles
// nnn nombre de la tile 1
// nnn nombre de la tile 2

#define draw

//draw_background(bg, 0, 0);

//botones
if keyboard_check(ord('R')) game_restart();
b1  = keyboard_check(37);
b2p = keyboard_check(38)*(b2=0);
b2  = keyboard_check(38);
b3  = keyboard_check(39);
b4  = keyboard_check(40);

tile_x[1] = mouse_x;
tile_y[1] = mouse_y;
tile_x2[1] = tile_x[1] + 16;
tile_y2[1] = tile_y[1] + 16;

tile_set_position(nnn, tile_x[0], tile_y[0]);
tile_set_position(nnn2, tile_x[1], tile_y[1]);

//movimiento y
tile_x2[0]=tile_x[0]+16
tile_y2[0]=tile_y[0]+16
g=7
if(hv=0 && b2p)s=15
if(s)s-=1
hv=g-s
while(tile_y2[0]+hv>200)hv-=1
tile_y[0]+=hv

//movimiento x
control=(b3+b1=1)
if(control)d=1-2*b1
v=5
hs=control*v*d

if(tile_x2[0]>tile_x[1] && tile_x[0]<tile_x[1] && tile_y2[0]>tile_y[1] && tile_y[0]<tile_y2[1]){draw_text(0,0,"colisión isquierda")while(tile_x2[0]+hs>tile_x[1])hs-=1}
if(tile_x[0]<tile_x2[1] && tile_x2[0]>tile_x2[1] && tile_y2[0]>tile_y[1] && tile_y[0]<tile_y2[1]){draw_text(0,0,"colisión derecha")while(tile_x[0]+hs<tile_x2[1])hs+=1}
tile_x[0]+=hs

//dibujos
//draw_rectangle(tile_x[0],tile_y[0],tile_x[0]+tile_width[0],tile_y[0]+tile_height[0])
draw_line(0,200,320,200)
