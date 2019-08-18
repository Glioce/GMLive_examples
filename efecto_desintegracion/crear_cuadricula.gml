///crear_cuadricula( size );
size = argument0;
for( i=0; i<sprite_width/size;  i+=1 )
for( j=0; j<sprite_height/size; j+=1 )
{
    px[i,j] = i*size;
    py[i,j] = j*size;
}
