/// scr_mob_state_hurt();
if(state_init)
{
// init state
    state_init = false;
    image_speed = 0.2;
    face = choose(0,1);

} else {
// execute state
    if(image_index >= image_number -1) image_index = image_number - 1;
}

