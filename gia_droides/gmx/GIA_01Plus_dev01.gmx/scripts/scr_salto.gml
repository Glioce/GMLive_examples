var jk;
jk=0
if (vspeed>vcrash && aplastado=0 && place_meeting(x,y+vspeed,obj_wall) && !place_meeting(x,y+vspeed,obj_trampolin) && !place_meeting(x,y+vspeed,obj_almoada))
{walk=0 aplastado=1 alarm[0]=60*3 player_colision(0);}

if (sprjump=0 && aplastado=0) {vspeed=salto jk=1}
