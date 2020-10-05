/// scr_shadow_state_dead();
if(state_init)
{
// init state
    state_init = false;
    image_speed = 0.3;
    image_index = 0;
} else {
// execute state
    alpha -= 0.1*image_speed;
    if(image_index >= image_number - 1) 
    {
        alarm_set(3, 2);
    }
}

