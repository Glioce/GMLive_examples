var instanceCount = 0;
if (!giaPaused)
{
    giaPaused = true;
    while(instance_number(all) > 1)
    {
        var obj;
        obj = instance_find(all, instanceCount);
        if (obj != self)
        {
            ds_stack_push(deactivatedInstances, obj);
            instance_deactivate_object(obj);
        }
        else
        {
            instanceCount ++;
        }
    }
}
else
{
    giaPaused = false;
    while(!ds_stack_empty(deactivatedInstances))
    {
        var obj;
        obj = ds_stack_pop(deactivatedInstances);
        instance_activate_object(obj);
    }
}
