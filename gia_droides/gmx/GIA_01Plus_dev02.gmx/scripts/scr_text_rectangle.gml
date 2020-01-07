/*
    @author: eduardo960
    
    argument0: x
    argument1: y
    argument2: string
    argument3: color (default: white)
    argument4: alpha (default: 1.0)
*/

draw_set_color(c_black)
if (argument4 == 0)
    draw_set_alpha(1);
else
    draw_set_alpha(argument4);

draw_rectangle(argument0 - string_width(argument2) / 2 - 8, argument1 - 4, argument0 + string_width(argument2) / 2 + 8, argument1 + string_height(argument2) + 4, 0);
if (!argument3)
    draw_set_color(c_white);
else
    draw_set_color(argument3);

draw_rectangle(argument0 - string_width(argument2) / 2 - 8, argument1 - 4, argument0 + string_width(argument2) / 2 + 8, argument1 + string_height(argument2) + 4, 1);
draw_set_halign(fa_center);
draw_set_alpha(1);
draw_text(argument0, argument1, argument2);
draw_set_halign(fa_left);
draw_set_alpha(1);
