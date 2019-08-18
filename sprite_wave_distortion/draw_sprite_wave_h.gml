/// draw_sprite_wave_h(spr, subimg, x, y, phase, amplitude, wavelength);

var _x, _y, p, a, wl, w, h, angle, i;
_x = argument2; //x position
_y = argument3; //y position
p  = argument4; //phase (0.0 - 1.0)
a  = argument5; //amplitude (pixels)
wl = argument6; //wavelength (pixels)
w  = sprite_get_width(argument0); //width
h  = sprite_get_height(argument0); //height

for (i = 0; i < h; i += 1)
{
  angle = (p + (i / wl)) * 2*pi;
  draw_sprite_part(argument0, argument1, 0, i, w, 1,
  sin(angle) * a + _x, i + _y);
}
