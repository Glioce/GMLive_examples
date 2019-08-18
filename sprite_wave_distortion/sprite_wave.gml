/// draw_sprite_wave_h(spr, subimg, x, y, phase, amplitude, wavelength);

var _x = argument2; //x position
var _y = argument3; //y position
var p  = argument4; //phase (0.0 - 1.0)
var a  = argument5; //amplitude (pixels)
var wl = argument6; //wavelength (pixels)
var w  = sprite_get_width(argument0); //width
var angle;

for (i=0; i<sprite_height; i+=1)
{
  angle = p + (i / wl);
  draw_sprite_part(argument0, argument1, 0, i, w, 1,
  sin(angle) * a + _x, i + _y);
}
