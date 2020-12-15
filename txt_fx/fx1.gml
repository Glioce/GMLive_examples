/// Inicializar Variables
//chr(10) //new line
//chr(13) //carriage return

//draw_set_font(fnCourier);

texto =
"¡Hola mundo! Este es el texo que usaremos#"+
"para probar los efectos especiales.##"+
"Estos efectos no son necesarios, pero nos#"+
"gusta complicarnos la vida ...";

P[0] = 0; //array de palabras
X[0] = 0; //posición horizontal de cada palabra
Y[0] = 0; //posición vertical de cada palabra
S[0] = 0; //escala de cada palabra
A[0] = 0; //alfa (opacidad) de cada palabra
xx = 0; //pos h actual en pixels
yy = 0; //pos v actual en pixels
k = 0; //indice para el array de todas las palabras

// lista de lineas
lineas = string_parse(texto, "#", false);
nl = ds_list_size(lineas); //número de líneas

//extraer las palabras de cada línea
for (i=0; i<nl; i++) {
   // lista de palabras
   palabras = string_parse(ds_list_find_value(lineas, i), " ", true);
   np = ds_list_size(palabras); //número de palabras
   
   // copiar palabras a un array
   for (j=0; j<np; j++) {
      P[k] = ds_list_find_value(palabras, j) + " "; //copiar palabra + espacio
      X[k] = xx; //pos h de la palabra
      Y[k] = yy; //pos v de la palabra
      S[k] = 0;
      A[k] = 0;
      xx += string_width(P[k]); //pos h de la sig palabra
      k++; //incrementar indice
   }
   xx = 0; //reiniciar pos h
   yy += string_height(P[k-1]); //actualizar pos v
   ds_list_destroy(palabras); //destruir lista
}
ds_list_destroy(lineas); //destruir lista
// k ahora guarda tamaño del array de palabras

// Prueba 1: mostrar todo el texto con alfa y escala gradual
/*for (i=0; i<k; i++) {
   S[i] = (k - i)/k; //escala
   A[i] = S[i]; //alfa
}*/

// Prueba 2: aparecer palabra por palabra
/*index = 0; //index dentro del array de palabras
delta = 0.1; //incremento de escala y opacidad
S[k-1] = 0; //escala
A[k-1] = 0; //alfa
*/
// Prueba 3: aparecer varias palabra en secuencia
num = 6; //numero de palabras que aparecen
val = 1/num; //valor en el que se aparece la sig palabra
index = 0; //index dentro del array de palabras
delta = 0.15; //incremento de escala y opacidad
//S[k-1] = 0; //escala
//A[k-1] = 0; //alfa

//show_debug_message(P);
//draw_text_transformed(xx[i], yy[i], p[i], 1, s[i], 0);

#define draw
/// Dibujar texto desde array
//draw_text(0, 0, texto);
//draw_text(0, 0, S[15]);

for (i=0; i<k; i++) {
   //draw_text(x + X[i], y + Y[i], P[i]);
   draw_set_alpha(A[i]);
   //draw_set_alpha(1);
   draw_text_transformed(x + X[i], y + Y[i], P[i], 1, S[i], 0);
}

/*if (index < k) {
   if (A[index] < 1) {
      A[index] += delta;
      S[index] += delta;
   }
   else index++;
}*/

if (index < k) {//si no han aparecido todas las palabras
   for (i=index; i>index-num; i--) {//aparecer varias palabras a la vez
      //si es una pos válida dentro del array
      //y no ha aparecido por completo
      if (i >= 0) and (A[i] < 1) {
         A[i] += delta;
         S[i] += delta;
      }
   }
   //si la palabra ha aparecido lo suficiente,
   //comienza a aparecer la siguiente
   if (A[index] >= val) and (index < k-1) index++;
}

draw_set_alpha(1);

#define string_parse
///string_parse(str, token, ignore)
//
//  Returns a ds_list containing all substring elements within
//  a given string which are separated by a given token.
//
//  eg. string_parse("cat|dog|house|bee", "|", true)
//      returns a ds_list { "cat", "dog", "house", "bee" }
//
//      str         elements, string
//      token       element separator,  string
//      ignore      ignore empty substrings, bool
//
/// GMLscripts.com/license
{
    var str,token,ignore,list,tlen,temp;
    str = argument0;
    token = argument1;
    ignore = argument2;
    list = ds_list_create();
    tlen = string_length( token);
    while (string_length(str) != 0) {
        temp = string_pos(token,str);
        if (temp) {
            if (temp != 1 || !ignore) ds_list_add(list,string_copy(str,1,temp-1));
            str = string_copy(str,temp+tlen,string_length(str));
        } else {
            ds_list_add(list,str);
            str = "";
        }
    }
    return list;
}
