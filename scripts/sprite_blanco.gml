///sprite_blanco( spr );

//Autor: Clamud, basado en algunos scripts de gmlscripts.com
//Versión: :GM8:
//Descripción: Crea una copia del sprite indicado, pero los pixeles no transparentes se hacen blancos.
//Devuelve el indice del nuevo sprite creado
//NOTA: el blend_mode cambia a bm_normal

var s, w, h, xo, yo, sf, i, s2;

s = argument0; //sprite
w = sprite_get_width(s); //anchura
h = sprite_get_height(s); //altura
n = sprite_get_number(s); //numero de sub-imagenes
xo = sprite_get_xoffset(s); //origen x
yo = sprite_get_yoffset(s); //origen y

sf = surface_create(w,h); //superficie
surface_set_target(sf); //establecer como lienzo
draw_set_blend_mode_ext( bm_zero, bm_src_alpha ); //copiar alfa

for( i=0; i<n; i+=1 )
{
    draw_clear( c_white ); //llenar de color blanco
    draw_sprite( s,i, xo,yo ); //copiar alfa
    if( i == 0 ) s2 = sprite_create_from_surface( sf, 0,0, w,h, false,false, xo,yo );
    else sprite_add_from_surface( s2,sf, 0,0, w,h, false,false );
}

draw_set_blend_mode( bm_normal );
surface_reset_target();
surface_free( sf );

return s2;
