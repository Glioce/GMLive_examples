physics_world_create(1 / 100);
physics_world_gravity(0, 0.1);
//object_set_sprite(obj_1, spr_white);

#define step
if mouse_check_button_pressed(mb_left) {
    instance_create(mouse_x, mouse_y, obj_1);
}

#define draw
with (obj_1) draw_circle(x,y, 5, false);

draw_text(0,0, room_width);
draw_text(0,16, room_height);
