/// Inicializar Variables

draw_set_font(fnCourier);

texto = 
"¡Hola mundo! Este es el texo que usaremos
para probar los efectos especiales.

Estos efectos no son necesarios, pero nos
gusta complicarnos la vida ...";

/*
L[0] = 0; //array de letras
X[0] = 0; //posición horizontal de cada letra
Y[0] = 0; //posición vertical de cada letra
S[0] = 0; //escala de cada letra
A[0] = 0; //alfa (opacidad) de cada letra
*/
L = ds_list_create();
X = ds_list_create();
Y = ds_list_create();
A = ds_list_create();
S = ds_list_create();
xx = 0; //pos h actual en pixels
yy = 0; //pos v actual en pixels
k = 0; //indice para el array de letras

// lista de lineas
lineas = string_parse(texto, "
", false);
var nl = ds_list_size(lineas); //número de líneas

//extraer las letras de cada línea
for (i=0; i<nl; i++) {
   var nn = string_length(lineas[|i]); //número de letras
   
   // copiar letras a la lista
   for (j=1; j<=nn; j++) {
      ds_list_add(L, string_char_at(lineas[|i], j));
      ds_list_add(X, xx); //pos h de la letra
      ds_list_add(Y, yy); //pos v de la letra
      xx += string_width(L[|k]); //pos h de la sig palabra
      k++; //incrementar indice
   }
   xx = 0; //reiniciar pos h
   yy += string_height(L[|k-1]); //actualizar pos v
}
ds_list_destroy(lineas); //destruir lista
// k ahora guarda tamaño de la lista de letras

// Prueba 1: mostrar todo el texto con alfa y escala gradual
/*for (i=0; i<k; i++) {
   S[|i] = (k - i)/k; //escala
   A[|i] = S[|i]; //alfa
}*/

// Prueba 2: aparecer letra por letra
/*index = 0; //index dentro del array de palabras
delta = 0.1; //incremento de escala y opacidad
S[|k-1] = 0; //escala
A[|k-1] = 0; //alfa
*/
// Prueba 3: aparecer varias letras en secuencia
index = 0; //index dentro del array de palabras
delta = 0.2; //incremento de escala y opacidad
num = 8; //numero de letras que aparecen
val = 1/num; //valor en el que se aparece la sig letra
S[|k-1] = 0; //escala
A[|k-1] = 0; //alfa

//show_debug_message(P);
//draw_text_transformed(xx[i], yy[i], p[i], 1, s[i], 0);

#define draw
/// Dibujar texto desde array

for (i=0; i<k; i++) {
   draw_set_alpha(A[|i]);
   draw_text_transformed(x + X[|i], y + Y[|i], L[|i], 1, S[|i], 0);
}

/*if (index < k) {
   if (A[|index] < 1) {
      A[|index] += delta;
      S[|index] += delta;
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
}

draw_set_alpha(1);

if keyboard_check_pressed(ord('R')) room_restart();
