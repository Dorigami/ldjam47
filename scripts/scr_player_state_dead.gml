/// scr_player_state_dead();
if(state_init)
{
// init state
    state_init = false;
    image_speed = 0.2;
    image_index = 0;
} else {
// execute state
    if(image_index >= image_number - 1)
    {
        image_speed = 0;
        image_index = image_number - 1; 
        if(alarm[4] < 0) alarm_set(4, room_speed);
    }
}

