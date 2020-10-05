/// scr_player_state_attack();
var inst = noone;
var atk_dir = point_direction(x + 0.5*sprite_width,y + 0.5*sprite_height,mouse_x, mouse_y);
var x_pt = x+0.5*sprite_width;
var y_pt = y+0.5*sprite_height;
var rng = 22;

if(state_init)
{
// init state
    state_init = false;
    face = round(atk_dir/180);
    if(face = 2) face = 0;
    //reset sprite for attack
    switch(attack)
    {
        case atk.melee:
            image_speed = spd * 0.06;
            image_index = 0;
            stam -= 10;
            if(face = 0) sprites[ATTACK, face] = spr_player_attack_right;
            if(face = 1) sprites[ATTACK, face] = spr_player_attack_left;
            break;
        case atk.block:
            image_speed = 0;
            if(face = 0) sprites[ATTACK, face] = spr_player_block_right;
            if(face = 1) sprites[ATTACK, face] = spr_player_block_left;
            break;
        case atk.nova:
            image_speed = spd * 0.06;
            image_index = 0;
            mana -= 50;
            if(face = 0) sprites[ATTACK, face] = spr_player_nova;
            if(face = 1) sprites[ATTACK, face] = spr_player_nova; 
            break;
        case atk.banish:
            image_speed = spd * 0.06;
            image_index = 0;
            mana -= 8;
            if(face = 0) sprites[ATTACK, face] = spr_player_banish_right;
            if(face = 1) sprites[ATTACK, face] = spr_player_banish_left; 
            break;
    }
} else {
// execute state
    //perform the designated attack
    switch(attack)
    {
        case atk.melee:
            //allow movement
            if(inp_up-inp_down != 0 || inp_right-inp_left != 0) 
            {
                move_axis = point_direction(0, 0, inp_right-inp_left, inp_down-inp_up);
                phy_position_x += lengthdir_x(0.5*spd, move_axis);
                phy_position_y += lengthdir_y(0.5*spd, move_axis);
            }
            //generate objects
            if(image_index > 1)
            {
                if(!attacked)
                {
                    attacked = true;
                    //create swing animation
                    inst = instance_create(x_pt, y_pt,obj_animation);
                    inst.sprite_index = spr_attack_swing;
                    inst.image_angle = atk_dir;
                    inst.image_speed = spd * 0.06;
                    //create the damage object
                    inst = instance_create(x_pt + lengthdir_x(rng, atk_dir), y_pt + lengthdir_y(rng, atk_dir),obj_damage);
                    inst.creator = id;
                    inst.radius = 22;
                    with(inst) alarm_set(0, 1); // this alarm destroy the damage object
                    
                }
            }
            break;
        case atk.block:
            atk_dir = point_direction(x + 0.5*sprite_width,y + 0.5*sprite_height,mouse_x, mouse_y);
            face = round(atk_dir/180);
            if(face = 2) face = 0;
            if(face = 0) sprites[ATTACK, face] = spr_player_block_right;
            if(face = 1) sprites[ATTACK, face] = spr_player_block_left;
            if(mouse_check_button_released(mb_right))
            {
                state_init = true;
                state = IDLE;
            }
            break;
        case atk.nova:
            if(face = 0) sprites[ATTACK, face] = spr_player_nova;
            if(face = 1) sprites[ATTACK, face] = spr_player_nova; 
            break;
        case atk.banish:
            if(image_index >= 1)
            {
                //charge up
                if(mouse_check_button(mb_left))
                {
                    image_index = 1;
                    mana -= 1;
                    damage += 0.5;
                }
                //release
                if(mouse_check_button_released(mb_left))
                {
                    inst = instance_create(x_pt + lengthdir_x(rng, atk_dir), y_pt + lengthdir_y(rng, atk_dir),obj_banish);
                    inst.damage = damage;
                    damage = 10;
                }
            }
            break;
    }
}
