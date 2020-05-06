// Evento Create

// cargar background
bg = background_add(
    "https://raw.githubusercontent.com/Glioce/GMLive_examples/master/blend_modes/bg.jpg",
    false, false
);

// dibujar un círculo con degradado en una surface
sf = surface_create(256, 256); //crear surface
surface_set_target(sf);
draw_clear(c_black); //llenar con color negro
//dibujar círculo, en el centro es blanco y en la orilla es negro
draw_circle_color(128, 128, 128, c_white, c_black, false);
surface_reset_target();

// crear sprite con la surface anterior
lamp = sprite_create_from_surface(sf, 0,0, 256,256, false, false, 128, 128);
surface_free(sf); //borrar surface, ya no se necesita

// tamaño de la room
w = room_width;
h = room_height;
trace(w);
trace(h);

// varaibles de las lámparas
x1 = random(w); y1 = random(h);
x2 = random(w); y2 = random(h);
x3 = random(w); y3 = random(h);

#define step // Evento Step

// mover luces
y1 = (y1 + 3) mod h;
y2 = (y2 + 3) mod h;
y3 = (y3 + 3) mod h;

// crear otra surface para dibujar las luces
if not surface_exists(sf) {
    sf = surface_create(w, h);
}

surface_set_target(sf);
draw_clear(c_black); //llenar con color negro
draw_set_blend_mode(bm_add); //las luces de las lámparas se suman si se empalman
draw_sprite(lamp,0, x1, y1); //lámpara 1
draw_sprite(lamp,0, x2, y2); //lámpara 2
draw_sprite(lamp,0, x3, y3); //lámpara 3
surface_reset_target();

#define draw //Evento Draw

draw_set_blend_mode(bm_normal); //modo de dibujo normal
draw_background_stretched(bg, 0,0, w,h); //dibujar fondo

// Cambiar modo de dibujo para hacer el efecto de iluminación
// La surface que hemos creado no se dibuja directamente,
// sino que multiplica el color de lo que ya está dibujado.
// Las zonas blancas en la surface dejan pasar el color sin cambios.
// Las zonas grises y negras oscurecen.
draw_set_blend_mode_ext(bm_zero, bm_src_colour);
draw_surface(sf, 0, 0);

draw_set_blend_mode(bm_normal); //regresar al modo de dibujo normal
