/// scr_shadow_state_flee();
if(state_init)
{
// init state
    state_init = false;
    image_speed = 0.1;
    image_index = 0;
} else {
// execute state
    if(!instance_exists(obj_player))
    {
        // go back to idling
        state_init = true;
        state = IDLE;
    }
    move_axis = point_direction(x,y,obj_player.x, obj_player.y);
    if(move_axis >= 180) 
    {
        move_axis -= 180;
    } else {
        move_axis += 180;
    }
    face = round(move_axis/180);
    if(face = 2) face = 0;
    //move 
    phy_position_x += lengthdir_x(0.75*spd, move_axis);
    phy_position_y += lengthdir_y(0.75*spd, move_axis);
    //stop fleeing
    if(alarm_get(2) < 0)
    {
        state_init = true;
        state = IDLE;
    }
}

