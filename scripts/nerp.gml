/// x = nerp( a, b, t, n );
// Interpolacion de grado n
var a = argument0; //valor inicial
var b = argument1; //valor final
var t = argument2; //tiempo [0,1]
var n = argument3; //exponente
return power(t,n) * (b-a) + a;
