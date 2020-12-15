/// Inicializar Variables

draw_set_font(fnCourier);

texto = 
"¡Hola mundo! Este es el texo que usaremos
para probar los efectos especiales.

Estos efectos no son necesarios, pero nos
gusta complicarnos la vida ...";

P = ds_list_create(); //lista de palabras
X = ds_list_create(); //posición horizontal de cada palabra
Y = ds_list_create(); //posición vertical de cada palabra
S = ds_list_create(); //escala de cada palabra
A = ds_list_create(); //alfa (opacidad) de cada palabra
xx = 0; //pos h actual en pixels
yy = 0; //pos v actual en pixels
k = 0; //indice para el array de todas las palabras

lineas = string_parse(texto, "
", false); // lista de lineas
var nl = ds_list_size(lineas); //número de líneas

//extraer las palabras de cada línea
for (i=0; i<nl; i++) {
   palabras = string_parse(lineas[|i], " ", true); // lista de palabras
   var np = ds_list_size(palabras); //número de palabras
   
   // copiar palabras a un array
   for (j=0; j<np; j++) {
      P[|k] = palabras[|j] + " "; //copiar palabra + espacio
      X[|k] = xx; //pos h de la palabra
      Y[|k] = yy; //pos v de la palabra
      xx += string_width(P[|k]); //pos h de la sig palabra
      k++; //incrementar indice
   }
   xx = 0; //reiniciar pos h
   yy += string_height(P[|k-1]); //actualizar pos v
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
num = 8; //numero de palabras que aparecen
val = 1/num; //valor en el que se aparece la sig palabra
index = 0; //index dentro del array de palabras
delta = 0.1; //incremento de escala y opacidad
S[|k-1] = 0; //escala
A[|k-1] = 0; //alfa

//show_debug_message(P);
//draw_text_transformed(xx[i], yy[i], p[i], 1, s[i], 0);

#define draw
/// Dibujar texto desde lista

for (i=0; i<k; i++) {
   draw_set_alpha(A[|i]);
   draw_text_transformed(x + X[|i], y + Y[|i], P[|i], 1, S[|i], 0);
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
      if (i >= 0) and (A[|i] < 1) {
         A[|i] += delta;
         S[|i] += delta;
      }
   }
   //si la palabra ha aparecido lo suficiente, 
   //comienza a aparecer la siguiente
   if (A[|index] >= val) and (index < k-1) index++;
   if (A[|index] >= 1) and (index == k-1) index++; //texto completo
      //show_debug_message("Texto completo "+string(k)+" "+string(index));}
}

draw_set_alpha(1);

if keyboard_check_pressed(ord('R')) room_restart();
