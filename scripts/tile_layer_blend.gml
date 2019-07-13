/// tile_layer_blend( depth, tileWidth, tileHeight, color );
/*                    0      1          2           3
Establece el color de una capa de tiles.
Autor: klm
Versión: :GM8: :GMS:

Argumentos | Descripción
---------------------------------------------
depth      | Profundidad de la capa de tiles
tileWidth  | Anchura de las tiles
tileHeight | Altura de las tiles
color      | Color para mezclar
*/

// inicializar variables
var _tileList = ds_list_create();
var _tileCount = 0;
var _tileId, _x, _y;

for (_y=0; _y<room_height; _y+=argument2) //escaneo vertical
for (_x=0; _x<room_width; _x+=argument1) //escaneo horizontal
{
   _tileId = tile_layer_find(argument0, _x,_y); //buscar tile
   if (_tileId <> -1) //si hay tile en esta posicion
   {
      ds_list_add(_tileList, _tileId); //agregar a la lista
      _tileCount ++; //incrementar contador
   }
}

// asignar color a todas las tiles encontradas
for (_x=0; _x<_tileCount; _x++)
{
   _tileId = ds_list_find_value(_tileList, _x);
   tile_set_blend(_tileId, argument3);
}

// destruir lista
ds_list_destroy(_tileList);
