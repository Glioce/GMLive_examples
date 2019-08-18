///dibujar_efecto( vel );
var z; //variable auxiliar
for( i=0; i<sprite_width/size;  i+=1 )
for( j=0; j<sprite_height/size; j+=1 )
{
    draw_sprite_part( sprite_index, image_index,
        i*size, j*size, size, size,
        x - sprite_xoffset + px[i,j],
        y - sprite_yoffset + py[i,j] );
        
    if( argument0 > 0 ){
        z = point_direction( px[i,j], py[i,j], sprite_width/2, sprite_height/2 );
        px[i,j] -= lengthdir_x( argument0, z ) + random_range(-1,1);
        py[i,j] -= lengthdir_y( argument0, z ) + random_range(-1,1);
    }
}
