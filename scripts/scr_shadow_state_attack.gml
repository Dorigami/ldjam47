/// scr_shadow_state_attack();
var inst = noone;
var x_pt = x+0.5*sprite_width;
var y_pt = y+0.5*sprite_height;
var rng = 25;

if(state_init)
{
// init state
    state_init = false;
    image_speed = 0.4;
    image_index = 0;

} else {
// execute state
    if(image_index > 2)
    {
        if(!attacked)
        {
            attacked = true;
            //create the damage object
            inst = instance_create(x_pt + lengthdir_x(rng, move_axis), y_pt + lengthdir_y(rng, move_axis),obj_damage);
            inst.creator = id;
            inst.radius = 20;
            with(inst) alarm_set(0, 1); // this alarm destroy the damage object
        }
        //move 
        phy_position_x += lengthdir_x(0.7*spd, move_axis);
        phy_position_y += lengthdir_y(0.7*spd, move_axis);
    }
}

