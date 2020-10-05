///scr_take_damage()
var prop = damage_taken / hp;

if(state = ATTACK && attack = atk.block && stam >= 5)
{
    hp -= 0.05*damage_taken;
    stam -= 5;
    damage_taken = 0;
} else {
    hp -= damage_taken;
    damage_taken = 0;
}
if(state != DEAD)
{
    //hurt
    if(prop >= 0.1)
    {
        state_init = true;
        state = HURT;
        alarm_set(0, 1.5*room_speed*prop);
    }
    //dead
    if(hp <= 0) 
    {
        hp = 0;
        state = DEAD;
        state_init = true;
    }
}
