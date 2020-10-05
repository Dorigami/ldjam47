/// scr_timemage_state_dead();
if(state_init)
{
// init state
    state_init = false;
    image_speed = 0;
} else {
// execute state
    alpha = clamp(alpha - 0.05, 0, 1);
    if(alpha = 0)
    {
        with(instance_create(0,0, obj_fade)) new_room = rm_victorymenu;
    }
}

