/// bat_chase_state();
if (instance_exists(obj_player)){
    var dir = point_direction(x, y, obj_player.x, obj_player.y);
    
    H_SPEED = lengthdir_x(CONST_SPEED, dir);
    V_SPEED = lengthdir_y(CONST_SPEED, dir);
    
    //change to the flying sprite
    sprite_index = spr_bat_fly;
    
    // Face the right direction
    if (H_SPEED != 0)
        image_xscale = sign(H_SPEED);
    
    // Move
        scr_move(obj_solid);
}
