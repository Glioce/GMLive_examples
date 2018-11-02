// Create Event
room_speed = 30;
physics_world_create(1 / 50);
physics_world_gravity(0, 0);

// ball
fixBall = physics_fixture_create();
physics_fixture_set_circle_shape(fixBall, 16);
physics_fixture_set_density(fixBall, 0.5);
physics_fixture_set_collision_group(fixBall, 1);
//physics_fixture_set_linear_damping(fixBall, 0);

// box
fixBox = physics_fixture_create();
physics_fixture_set_box_shape(fixBox, 8, 8);
physics_fixture_set_density(fixBox, 0.5);
physics_fixture_set_collision_group(fixBox, 1);
sprite_set_offset(spr_white16, 8, 8);

// chain / border
//use a path to define points
ptChain = path_add();
path_add_point(ptChain, 128,  48, 0);
path_add_point(ptChain, 256, 192, 0);
path_add_point(ptChain,  64, 224, 0);
//create the fixture
fixChain = physics_fixture_create();
physics_fixture_set_collision_group(fixChain, 1);
physics_fixture_set_chain_shape(fixChain, true);
//add points from a path
for (i=0; i<path_get_number(ptChain); i++)
    physics_fixture_add_point(fixChain,
        path_get_point_x(ptChain, i),
        path_get_point_y(ptChain, i)
    );
//bind the fixture
_inst = instance_create(0, 0, obj_3);
physics_fixture_bind(fixChain, _inst);

trace("Start");

#define step // Step Event
if mouse_check_button_pressed(mb_left) {
    switch choose(0, 1) {
        case 0: //create a circle
            _inst = instance_create(mouse_x, mouse_y, obj_1);
            physics_fixture_bind(fixBall, _inst);
            break;
        case 1:  //create a box
            _inst = instance_create(mouse_x, mouse_y, obj_2);
            physics_fixture_bind(fixBox, _inst);
            _inst.sprite_index = spr_white16;
            break;
    }
    //assign random color
    _inst.image_blend = make_color_hsv( random(255), 255, 255);
}

#define draw // Draw Event
with (obj_1) { //draw a circle
    draw_set_color(image_blend);
    draw_circle(x, y, 16, false);
}
/*with (obj_2) { //draw a box
    draw_self();
}*/
draw_set_color(c_white);
draw_path(ptChain, 0, 0, true);