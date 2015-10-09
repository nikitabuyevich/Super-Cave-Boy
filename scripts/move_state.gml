/// move_state();

// Implementing gravity
if (!place_meeting(x, y+1, obj_solid)){
    V_SPEED += CONST_GRAVITY;
    
    // Player is in the air
    sprite_index = spr_player_jump;
    image_speed = 0;
    image_index = (V_SPEED > 0);
    
    // Control the jump height
    if (up_release && V_SPEED < JUMP_H_ON_PRESS) {
        V_SPEED = JUMP_H_ON_PRESS;
    }
} else {
    V_SPEED = 0;
    
    // Jumping
    if (up) {
        V_SPEED = JUMP_H;    
        audio_play_sound(snd_jump, 5, false);
    }
    
    // Player on the ground
    if (H_SPEED == 0){
        sprite_index = spr_player_idle;
    } else {
        sprite_index = spr_player_walk;
        if (PlayerStats.gotboots == true)
            image_speed = 1.2;
        else
            image_speed = 0.6;
        if (PlayerStats.gotboots == true){
            repeat (irandom_range(1, 3)) {
            var rand_x = irandom_range(-4, 4);
            var rand_y = irandom_range(-4, 4);
            
            instance_create(obj_player.x-8+rand_x, obj_player.y+9+rand_y, SpeedParticles);
            if (!audio_is_playing(snd_moving)){
                audio_emit = audio_emitter_create();
                audio_emitter_gain(audio_emit, 0.10);
                audio_emitter_pitch(audio_emit, 2);
                audio_play_sound_on(audio_emit, snd_moving, false, 10);
            }
        }
}
    }
}   


// Move character based on keyboard arrows
// and check for walls
if (right || left) {
    H_SPEED += (right-left)*CONST_ACCEL;

    if (H_SPEED > CONST_SPEED)
        H_SPEED = CONST_SPEED;
    
    if (H_SPEED < -CONST_SPEED)
        H_SPEED = -CONST_SPEED;
} else {
    apply_friction(CONST_ACCEL);
}

if (H_SPEED != 0) {
    image_xscale = sign(H_SPEED);
}

// Play the landing sound
if (place_meeting(x, y+V_SPEED+1, obj_solid) && V_SPEED > 0) {
    audio_emitter_pitch(audio_em, random_range(0.8, 1.2));
    audio_emitter_gain(audio_em, 0.2);
    audio_play_sound_on(audio_em, snd_step, false, 6);
}

scr_move(obj_solid);

// Check for ledge grab state
var falling = y-yprevious > 0;
var wasnt_wall = !position_meeting(x+17*image_xscale, yprevious, obj_solid);
var is_wall = position_meeting(x+17*image_xscale, y, obj_solid);

if (falling && wasnt_wall && is_wall) {
    H_SPEED = 0;
    V_SPEED = 0;
    
    // Move against the ledge
    while (!place_meeting(x+image_xscale, y, obj_solid)){
        x += image_xscale;
    }
    
    // Make sure we are the right height
    while (position_meeting(x+17*image_xscale, y-1, obj_solid)){
        y -= 1;
    }
    
    sprite_index = spr_player_ledge_grab;
    state = ledge_grab_state;
    
    // Play the ledge grab sound
    audio_emitter_pitch(audio_em, 1.5);
    audio_emitter_gain(audio_em, 0.1);
    audio_play_sound_on(audio_em, snd_step, false, 6);
}
