//objetos predefinidos
obBall = obj_1;
obRing = obj_2;
room_speed = 60;
physics_world_create(1 / 100);
physics_world_gravity(0, 1.0);

fixBall = physics_fixture_create();
physics_fixture_set_circle_shape(fixBall, 16);
physics_fixture_set_density(fixBall, 0.5);
physics_fixture_set_linear_damping(fixBall, 0);
physics_fixture_set_collision_group(fixBall, 1);

fixRing = physics_fixture_create();
physics_fixture_set_circle_shape(fixRing, 8);
physics_fixture_set_density(fixRing, 0);
physics_fixture_set_kinematic(fixRing);
physics_fixture_set_collision_group(fixRing, 1);

_inst = instance_create(50, 100, obRing);
physics_fixture_bind(fixRing, _inst);
_inst = instance_create(100, 100, obRing);
physics_fixture_bind(fixRing, _inst);
    

#define step
if mouse_check_button_pressed(mb_left) {
    _inst = instance_create(mouse_x, mouse_y, obBall);
    physics_fixture_bind(fixBall, _inst);
}

#define draw
draw_set_color(c_red);
with (obRing) draw_circle(x,y, 8, false);

draw_set_color(c_orange);
with (obBall) draw_circle(x,y, 16, false);

draw_set_color(c_white);
draw_text(0,0, "room: "+string(room_width)+" x "+string(room_height));
draw_text(0,16, "fps: "+string(room_speed));
draw_text(0,32, "score: "+string(score));
