/// y = ecos( a, b, t, r, n );
// "Elastic Cosine"
// Es una funcion parecida a la respuesta dinamica de una funcion escalon
// Se basa en la funcion coseno desplazada y restringida por
// dos curvas que intersectan en (r,1).
// Si t == 0, devuelve a
// Si t == 1, devuelve b
var a = argument0; //valor inicial
var b = argument1; //valor final
var t = argument2; //tiempo [0,1]
var r = argument3; //radianes maximos
var n = argument4; //exponente
var f = 1 - (cos(t*r) * (1 - power(t,n)));
return f * (b - a) + a;
