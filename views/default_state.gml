//view_enabled = true;
//view_visible[0] = true;

#define draw
draw_text(0,  0, view_xview[0]);
draw_text(0, 20, view_yview[0]);
draw_text(0, 40, view_wview[0]);
draw_text(0, 60, view_hview[0]);

draw_text(0, 100, view_xport[0]);
draw_text(0, 120, view_yport[0]);
draw_text(0, 140, view_wport[0]);
draw_text(0, 160, view_hport[0]);

draw_text(0, 200, surface_get_width(application_surface));
draw_text(0, 220, surface_get_height(application_surface));
draw_text(0, 240, application_surface_is_enabled());
