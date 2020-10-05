/// scr_player_state_move();

move_axis = point_direction(0, 0, inp_right-inp_left, inp_down-inp_up);

if(state_init)
{
// init state
    state_init = false;
    image_speed = 0.3;
} else {
// execute state
        //weapon swap
        if(inp_swap && has_staff = true)
        {
            switch(equipped)
            {
                case weapon.sword:
                    equipped = weapon.staff;
                    break;
                case weapon.staff:
                    equipped = weapon.sword;
                    break;
            }
        }
    // exit state
    if(!inp_up && !inp_down && !inp_right && !inp_left)
    {
        state = IDLE;
        state_init = true;
        exit;
    }
    // set face
    scr_set_face(move_axis);
    //move player
    phy_position_x += lengthdir_x(spd, move_axis);
    phy_position_y += lengthdir_y(spd, move_axis);
        //attack
        if(inp_attack) 
        {
            if(equipped = weapon.sword)
            {
                attack = atk.melee;
            } else {
                attack = atk.banish;
            }
            state_init = true;
            state = ATTACK;
        }
        if(inp_defend) 
        {
            if(equipped = weapon.sword)
            {
                attack = atk.block;
            } else {
                attack = atk.nova;
            }
            state_init = true;
            state = ATTACK;
        }
    //dash
    if(inp_dash && alarm[2] < 0)
    {
        state_init = true;
        state = DASH;
    }
}


