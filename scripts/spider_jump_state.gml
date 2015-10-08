/// spider_jump_state

image_index = image_number-1;

// Apply gravity
if (!place_meeting (x, y+1, obj_solid)) {
    V_SPEED += grav;
} else {
    V_SPEED = 0;
    
    // use friction
    
    apply_friction(acc);
    
    // Check for idle state
    if (H_SPEED == 0 && V_SPEED == 0) {
        state = spider_idle_state;
        alarm[0] = 15;
        image_speed = 0;
        image_index = 0;
    }
}

if (H_SPEED != 0)
    image_xscale = sign(H_SPEED);

// move
horizontal_move_bounce(obj_solid);
