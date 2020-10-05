///scr_loot_drop(id);
var inst = argument[0];

switch(inst.object_index)
{
    case obj_timemage:
        break;
    case obj_shadow:
        repeat(3+global.loop)
        {
            instance_create(inst.x+0.5*inst.sprite_width, inst.y+0.5*inst.sprite_height, obj_essence);
        }
        break;
    case obj_shade:
        break;
}

