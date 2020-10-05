/// scr_shadow_state_move();
if(state_init)
{
// init state
    state_init = false;
    image_speed = 0.2;
    alarm_set(1, room_speed);
    move_axis = irandom(359);
    face = round(move_axis/180);
    if(face = 2) face = 0;
} else {
// execute state
    //move 
    phy_position_x += lengthdir_x(0.4*spd, move_axis);
    phy_position_y += lengthdir_y(0.4*spd, move_axis);

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

