/// scr_player_state_dash();
var ani_speed = 1;

if(state_init)
{
// init state
    state_init = false;
    image_speed = ani_speed;
    image_index = 0;
    obj_view.x += 16;
    obj_view.y += 16; //recenter the view
    if(inp_up-inp_down != 0 || inp_right-inp_left != 0) 
    {
        move_axis = point_direction(0, 0, inp_right-inp_left, inp_down-inp_up);
    } else {
        move_axis = point_direction(x+0.5*sprite_width, y+0.5*sprite_height, mouse_x, mouse_y);
    }
    scr_set_face(move_axis);
    alarm_set(1, 0.4*room_speed) // dash duration timer
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
    if(alarm_get(1) > 0)
    {
        //wait for the end of animation then move the player
        if(image_index >= image_number-1)
        {
            image_index = image_number-1;
            image_speed = 0;
            // Create the dash effect
            var dash = instance_create(x, y, obj_dash_effect);
            dash.sprite_index = sprite_index;
            dash.image_index = image_number-1;
            //move player
            phy_position_x += lengthdir_x(1.8*spd, move_axis);
            phy_position_y += lengthdir_y(1.8*spd, move_axis);
        }
    } else {
        image_index = -ani_speed;
        if(image_index <= 0)
        {
            alarm_set(2, 0.5*room_speed);
            phy_rotation = 0;
            state = IDLE;
            state_init = true;
        }
    }
}

