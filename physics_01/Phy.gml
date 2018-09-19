// predefined objects
obBall = obj_1;
obRing = obj_2;
room_speed = 30;
physics_world_create(1 / 100);
physics_world_gravity(0, 1.0);

// ball
fixBall = physics_fixture_create();
physics_fixture_set_circle_shape(fixBall, 16);
physics_fixture_set_density(fixBall, 0.5);
physics_fixture_set_linear_damping(fixBall, 0);
physics_fixture_set_collision_group(fixBall, 1);

// ring
fixRing = physics_fixture_create();
physics_fixture_set_circle_shape(fixRing, 8);
physics_fixture_set_density(fixRing, 0);
physics_fixture_set_kinematic(fixRing);
physics_fixture_set_collision_group(fixRing, 1);

_inst = instance_create(100, 150, obRing)
physics_fixture_bind(fixRing, _inst);
_inst = instance_create(150, 150, obRing);
physics_fixture_bind(fixRing, _inst);
trace("Start");
    
#define step
if mouse_check_button_pressed(mb_left) {
    with instance_create(mouse_x, mouse_y, obBall) {
        physics_fixture_bind(other.fixBall, id);
        xp = phy_position_x; //x previous
        yp = phy_position_y; //y previous
    }
}

with (obBall)
{
    if (phy_position_y >= obj_2.phy_position_y)
    and (yp < obj_2.phy_position_y)
    {
        c = lines_intersect(xp, yp, phy_position_x, 
        phy_position_y, 100, 150, 150, 150, true);
        if (c > 0 and c <= 1)
        {
            score += 1;
            trace("point");
        }
    }
    xp = phy_position_x;
    yp = phy_position_y;
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

#define lines_intersect
/// lines_intersect(x1,y1,x2,y2,x3,y3,x4,y4,segment)
//
//  Returns a vector multiplier (t) for an intersection on the
//  first line. A value of (0 < t <= 1) indicates an intersection 
//  within the line segment, a value of 0 indicates no intersection, 
//  other values indicate an intersection beyond the endpoints.
//
//      x1,y1,x2,y2     1st line segment
//      x3,y3,x4,y4     2nd line segment
//      segment         If true, confine the test to the line segments.
//
//  By substituting the return value (t) into the parametric form
//  of the first line, the point of intersection can be determined.
//  eg. x = x1 + t * (x2 - x1)
//      y = y1 + t * (y2 - y1)
//
/// GMLscripts.com/license
{
    var ua, ub, ud, ux, uy, vx, vy, wx, wy;
    ua = 0;
    ux = argument2 - argument0;
    uy = argument3 - argument1;
    vx = argument6 - argument4;
    vy = argument7 - argument5;
    wx = argument0 - argument4;
    wy = argument1 - argument5;
    ud = vy * ux - vx * uy;
    if (ud != 0) 
    {
        ua = (vx * wy - vy * wx) / ud;
        if (argument8) 
        {
            ub = (ux * wy - uy * wx) / ud;
            if (ua < 0 || ua > 1 || ub < 0 || ub > 1) ua = 0;
        }
    }
    return ua;
}
