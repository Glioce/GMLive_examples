if (global.JN > 0)
{
    for (i = 1; i <= global.JN; i += 1)
    {
        if global.J[i,global.nzonas]!=-1
        {
            if place_meeting(x,y-2-global.J[i,0].vspeed,global.J[i,0])
            {
                image_index = 1;
                break;
            }
            else
            {
                image_index = 0;
            }
        }
    }

    if (instance_exists(obj_ctrl))
    {
        if (obj_ctrl.alarm[0] != -1)
        {
            image_index = 0;
        }
    }
}
else
{
    image_index = 0;
}
