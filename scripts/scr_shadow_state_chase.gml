/// scr_mob_state_chase();
if(state_init)
{
// init state
    state_init = false;
    image_speed = 0.4;
    image_index = 0;
    move_axis = point_direction(x,y,obj_player.x, obj_player.y);
    alarm_set(1, -1);
} else {
// execute state
    if(!instance_exists(obj_player))
    {
        //go back to idling
        state_init = true;
        state = IDLE;
    }
    
    move_axis += 0.5*angle_difference(point_direction(x,y,obj_player.x, obj_player.y), move_axis); 
    face = round(move_axis/180);
    if(face = 2) face = 0;
    //move 
    phy_position_x += lengthdir_x(spd, move_axis);
    phy_position_y += lengthdir_y(spd, move_axis);

    
    if(instance_exists(obj_player))
    {
    // out of aggro range
        if(point_distance(x,y,obj_player.x,obj_player.y) >= 1.5*sight_range)
        {
            state_init = true;
            state = IDLE;
        }
    // attack range
        if(point_distance(x,y,obj_player.x,obj_player.y) <= attack_range)
        {
            state_init = true;
            state = ATTACK;
        }
    }
}

