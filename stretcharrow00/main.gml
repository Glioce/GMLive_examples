// Load sprites
spCircle = sprite_add(
    "https://raw.githubusercontent.com/Glioce/GMLive_examples/master/stretcharrow00/spCircle.png",
    1, true, false, 24, 24
);
spLine = sprite_add(
    "https://raw.githubusercontent.com/Glioce/GMLive_examples/master/stretcharrow00/spLine_strip4.png",
    4, true, false, 0, 16
);

sprite_index = spLine;
image_speed = 0.3;

x = 200;
y = 200;

#define draw //Draw Event
// Rotate and scale
image_angle = point_direction(x, y, mouse_x, mouse_y);
image_xscale = point_distance(x, y, mouse_x, mouse_y) / 64;

draw_self();
draw_sprite(spCircle, 0, mouse_x, mouse_y);
