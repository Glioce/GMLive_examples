var isDead = false;
if (other.mask_index == msk_pinches)
{
    if (vspeed > 0 && y < other.y)
        isDead = true;
}
else if (other.mask_index == msk_pinches_rev)
{
    if (vspeed < 0 && y > other.y)
        isDead = true;
}
else
{
    isDead = true;
}

if (isDead)
{
    for (j = 0; j <= global.nzonas - global.Level; j += 1)
    {
        for (i = 1;i <= global.JN; i += 1)
        {
            if (global.Nombre[i] == nombre)
            {
                global.J[i, global.Level + j] = -1;
            }
        }
    }
}
