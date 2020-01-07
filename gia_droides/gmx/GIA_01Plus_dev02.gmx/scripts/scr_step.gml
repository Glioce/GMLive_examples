if walk=1 && (!place_meeting(x+velocidadh,y,obj_wall) && !place_meeting(x + velocidadh + 1, y, obj_global_pinches)) {x+=velocidadh face=1}
if walk=-1 && (!place_meeting(x-velocidadh,y,obj_wall) && !place_meeting(x - velocidadh - 1, y, obj_global_pinches)) {x-=velocidadh face=-1}

if place_meeting(x,y+1,obj_sright) && sprjump=0 {x+=2}
if place_meeting(x,y+1,obj_sleft) && sprjump=0 {x-=2}

if sprjump=0 {gravity=0} else {gravity=gvty}
