/// array = acelerar( xi, vi, a, t, vm );
// Devuelve un array con posicion final y velocidad final

var xi = argument0; //posicion inicial
var vi = argument1; //velocidad inicial
var a = argument2; //aceleracion (debe ser positiva)
var t = argument3; //tiempo transcurrido (debe ser positivo)
var vm = argument4; //velocidad meta, es la velocidad a la que se debe acercar
var d; //desplazamiento
var v; //velocidad final
var r; //resultado
//var x; //posicion final

a *= sign(vm - vi); //signo de la aceleracion
//si v meta es mayor a v inicial, a es positiva
//si v meta es menor a v inicial, a es negativa
//si v meta es igual a v inicial, a es cero

v = vi + (a * t); //velocidad final

// si la velocidad rebasa la meta
if (abs(v - vi) > abs(vm - vi)) {
   var t1 = (vm - vi) / a; //tiempo en el que alcanza el limite
   var t2 = t - t1; //tiempo restante
   var d1 = (vi * t1) + (a * t1 * t1 / 2); //desplazamiento en el primer perido
   var d2 = vm * t2; //desplazamiento en el segundo periodo
   d = d1 + d2; //desplazamiento total
   v = vm; //velocidad final = velocidad meta
}
// si v no rebasa la meta
else d = (vi * t) + (a * t * t / 2); //desplazamiento

r[0] = xi + d; //posicion final
r[1] = v; //velocidad final
return r; //devolver resultado
