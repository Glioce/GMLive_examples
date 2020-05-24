// Create Event

// inicializar mundo
room_speed = 60;
physics_world_create(1/200);
physics_world_gravity(0, 5);

// fixture puntero
fix = physics_fixture_create();
physics_fixture_set_density(fix, 0.5);
physics_fixture_set_angular_damping(fix, 0.9);
physics_fixture_set_restitution(fix, 0.0);
physics_fixture_set_collision_group(fix, 1);
physics_fixture_set_box_shape(fix, 20, 20); //forma rectangular
//bind the fixture
instMouse = instance_create(400, 200, obj_1);
physics_fixture_bind(fix, instMouse);
physics_fixture_delete(fix); //ya no se necesita

// fixture llavero/accesorio
fix = physics_fixture_create();
physics_fixture_set_density(fix, 0.05);
physics_fixture_set_angular_damping(fix, 0.9);
physics_fixture_set_restitution(fix, 0.0);
physics_fixture_set_collision_group(fix, 1);
physics_fixture_set_box_shape(fix, 50, 5); //forma rectangular
//bind the fixture
instAcc = instance_create(480, 220, obj_1);
physics_fixture_bind(fix, instAcc);
physics_fixture_delete(fix); //ya no se necesita

// unir accesorio a puntero
physics_joint_revolute_create(
    instMouse, instAcc, //instancias involucradas
    420, 220, //coordenadas de la unión
    0, 0, false, //no hay ángulo límite
    0, 0, false, //no hay motor
    false //las inancias no colisionan
);

// borde de la room
fixChain = physics_fixture_create(); 
physics_fixture_set_collision_group(fixChain, 1);
physics_fixture_set_chain_shape(fixChain, true);
//add points
physics_fixture_add_point(fixChain, 5, 5);
physics_fixture_add_point(fixChain, 800, 5);
physics_fixture_add_point(fixChain, 800, 500);
physics_fixture_add_point(fixChain, 5, 500);
//bind the fixture
instChain = instance_create(0, 0, obj_1);
physics_fixture_bind(fixChain, instChain);

#define step
// seguir puntero del mouse
instMouse.phy_speed_x = mouse_x - instMouse.phy_position_x;
instMouse.phy_speed_y = mouse_y - instMouse.phy_position_y;

#define draw
physics_world_draw_debug(
    //phy_debug_render_aabb |
    //phy_debug_render_collision_pairs |
    //phy_debug_render_coms |
    //phy_debug_render_core_shapes |
    phy_debug_render_joints |
    //phy_debug_render_obb |
    phy_debug_render_shapes
);
//draw_line(400, 0, 400, 500);
//draw_line(0, 200, 800, 200);
