// Create Event

// inicializar mundo
physics_world_create(1/50);
physics_world_gravity(0, 5);

o_id = noone; //instancia nueva
p_id = noone; //instancia previa
x = 150;
y = 100;

fix = physics_fixture_create(); //crear fixture
physics_fixture_set_density(fix, 0.5);
physics_fixture_set_collision_group(fix, 1);
physics_fixture_set_box_shape(fix, 50, 20); //forma rectangular

for (i = 0; i < 5; i++;) //unir 5 piezas
{
    o_id = instance_create(x + (120 * i), y, obj_1); //instancia
    physics_fixture_bind(fix, o_id); //asignar fixture
    
    if (i > 0 && i < 5)
    {
        //agregar uniones a las instancias intermedias
        physics_joint_weld_create(p_id, o_id,
        x + (120 * i) - 60, y, 0, 10, 12, false);
    }
    p_id = o_id;
}

repeat(3)
{
    _inst = instance_create(
        random_range(300, 500), 
        random_range(300, 400), obj_1);
    physics_fixture_bind(fix, _inst);
}

fixChain = physics_fixture_create();
physics_fixture_set_collision_group(fixChain, 1);
physics_fixture_set_chain_shape(fixChain, true);
//add points
physics_fixture_add_point(fixChain, 5, 5);
physics_fixture_add_point(fixChain, 800, 5);
physics_fixture_add_point(fixChain, 800, 500);
physics_fixture_add_point(fixChain, 5, 500);
//bind the fixture
_inst = instance_create(0, 0, obj_2);
physics_fixture_bind(fixChain, _inst);

#define step
if mouse_check_button_pressed(mb_left)
{
    _inst = instance_create(mouse_x, mouse_y, obj_1);
    physics_fixture_bind(fix, _inst);
}

#define draw
physics_world_draw_debug(
    //phy_debug_render_aabb |
    //phy_debug_render_collision_pairs |
    phy_debug_render_coms |
    //phy_debug_render_core_shapes |
    phy_debug_render_joints |
    //phy_debug_render_obb |
    phy_debug_render_shapes
);
