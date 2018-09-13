spRun = sprite_add(
    "https://raw.githubusercontent.com/Glioce/GMLive_examples/master/animation_transitions_2D/alucard_run.png",
    8, true, false, 0, 0
);
sprite_index = spRun;
image_speed = 0.25;
image_xscale = 2;
image_yscale = 2;
texture_set_interpolation(false);

#define draw
draw_self();
