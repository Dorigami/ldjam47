/// scr_player_state_idle();
if(state_init)
{
// init state
    state_init = false;
    image_speed = 0.05;
} else {
// execute state
    //register inputs
    if(state = IDLE)
    {
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
        //movement
        if(inp_up-inp_down != 0 || inp_right-inp_left != 0) 
        {
            state_init = true;
            state = MOVE;
        }
        //attack
        if(inp_attack && alarm[3] < 0) 
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
}

