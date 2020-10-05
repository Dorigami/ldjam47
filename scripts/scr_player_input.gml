///scr_player_input();

inp_up = keyboard_check(ord("W"));
inp_left = keyboard_check(ord("A"));
inp_down = keyboard_check(ord("S"));
inp_right = keyboard_check(ord("D"));

inp_attack = mouse_check_button_pressed(mb_left);
inp_defend = mouse_check_button_pressed(mb_right);
inp_dash = keyboard_check_pressed(vk_space);
inp_swap = keyboard_check_pressed(ord("Q"));

inp_startmenu = keyboard_check_pressed(vk_escape);

if(keyboard_check(vk_right)) essence += 1;
