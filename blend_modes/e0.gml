bg = background_add(
    "https://raw.githubusercontent.com/Glioce/GMLive_examples/master/blend_modes/bg.jpg",
    false, false
);
gr = background_add(
    "https://raw.githubusercontent.com/Glioce/GMLive_examples/master/blend_modes/gr.png",
    false, false
);
alpha = 0.0;
delta = 0.01;
w = display_get_gui_width();
h = display_get_gui_height();

#define draw
draw_set_blend_mode(bm_normal);
draw_background(bg, 0, 0);
//draw_background_stretched(bg, 0,0, w,h);

#define draw_gui
draw_set_blend_mode(bm_add);
draw_background_ext(gr, 0,0, 1,1,0, c_white,alpha);
//draw_background_stretched_ext(gr, 0,0, w,h, c_white,alpha);

alpha += delta;
if (alpha >= 1 or alpha <= 0) delta *= -1;
