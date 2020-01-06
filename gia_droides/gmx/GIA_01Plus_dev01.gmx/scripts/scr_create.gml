sprite_index=argument0;
image_speed=0;
image_alpha=1;
vcrash = 6;
gvty = 0.15;
gravity=gvty;
gravity_direction=270;
sprjump=1;   //variable que usaremos para saber si el personaje esta en el suelo o aire (0 = Suelo, 1 = Aire)
salto=-3.8;   // velocidad vertical del salto
velocidadh=2;
accelh=0.2;
speedmax=4;
friccionh=0.1;
aplastado=0;

walk=0;      //variable que usaremos para saber hacia donde estamos caminando (1 = Derecha, 2 = Izquierda)
move=0;     //variable que usaremos para saber si nos estamos moviendo (0 = parado, 1 = moviendose)
face=1;      //variable que usaremos para saber para donde estamo viendo esta vairalbe en si no la pondriamos en practica completa en este tutorial 
                    //pero es bueno tenerla si quieres usar algo como disparos .(1 = derecha, -1 = izquierda)

if (argument0 != -1)                    
    scr_particulas();
