/// scr_timemage_state_idle();
if(state_init)
{
// init state
    state_init = false;
    image_speed = 0.05;
} else {
// execute state
    //keep spawning
    if(instance_number(obj_shadow < wave_cap))
    {
        if(alarm[1] < 0)
        {
            var len = irandom(spawn_range);
            var dir = irandom(359);
            show_debug_message("minion spawned")
            with(instance_create(x+0.5*sprite_width+lengthdir_x(len, dir), y+0.5*sprite_height+lengthdir_y(len, dir), obj_shadow))
            {
                sight_range += 50;
            }
            alarm_set(1, wave_timer)
        }
    }
}

