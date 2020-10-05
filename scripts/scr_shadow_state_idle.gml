/// scr_shadow_state_idle();
if(state_init)
{
// init state
    state_init = false;
    image_speed = 0.1;
    alarm_set(1, room_speed);
} else {
// execute state
    if(instance_exists(obj_player))
    {
    //aggro range
        if(point_distance(x,y,obj_player.x,obj_player.y) <= sight_range)
        {
            state_init = true;
            state = CHASE;
        }
    //attack_range
        if(point_distance(x,y,obj_player.x,obj_player.y) <= attack_range)
        {
            state_init = true;
            state = ATTACK;
        }
    //flee
        if(alarm_get(2) > 0)
        {
            state_init = true;
            state = IDLE;
        }
    }
}

