/// bat_idle_state();
image_index = spr_bat_idle;

// Look for the player
if (instance_exists(obj_player)){
    var dis = point_distance(x, y, obj_player.x, obj_player.y);
    
    if (dis < SIGHT_RANGE) {
        state = bat_chase_state;
    }
}
