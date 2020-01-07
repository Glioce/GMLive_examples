if place_meeting(x,y+1,obj_wall) {sprjump=0} else {sprjump=1}
if (place_meeting(x,y+vspeed,obj_wall) && !place_meeting(x,y+vspeed,obj_trampolin) && !place_meeting(x,y+vspeed,obj_almoada) && vspeed>10 && aplastado=0) {aplastado=1 alarm[0]=30*3}
walk=0; 
move=0;
