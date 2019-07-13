///string_matrix( string );
/*
Autor: Clamud
Versión: GameMaker Studio
Descripción: Crea una matriz 2D de números reales a partir de una cadena, usa 'coma' para 
separar las columnas y 'punto y coma' para separar las filas. Se pueden usar espacios, 
puntos decimales y saltos de línea. La cadena debe terminar con 'punto y coma'.

  Crea una matriz 2D a partir de una cadena
  , separa las columnas
  ; separa los renglones
  
Ejemplo:
Matrix = string_matrix("
1.10, 2.00, 3.14, 4.00;
5.00, 6.66, 7.00, 8.00;
9.22, 10.0, 11.1, 12.9;
");
*/

var cad = argument0; //cadena
var lon = string_length(cad); //longitud
var pos; //posicion
var mat; //matriz
var car; //caracter
var sub = ""; //sub-cadena
var i=0, j=0; //indices

for( pos=1; pos<=lon; pos++ ) //para todos los caracteres
{
    car = string_char_at( cad, pos ); 
    if( car == "," ){ //si es coma
        mat[i,j] = real(sub); //agregar valor a la matriz
        sub = ""; //borrar sub-cadena
        i++; //incrementar indice
    }
    else if( car == ";" ){ //si es punto y coma
        mat[i,j] = real(sub); //agregar valor a la matriz
        sub = ""; //borrar sub-cadena
        i = 0; //reiniciar i
        j++; //incrementar j
    }
    else sub += car; //agregar caracter a sub-cadena
}
return mat; //devolver matriz
