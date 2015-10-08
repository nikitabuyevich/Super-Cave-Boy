/// hurt_state();

// set the sprite
sprite_index = spr_player_hurt;

if (H_SPEED != 0)
    image_xscale = sign(H_SPEED);
    
// Apply gravity
if (!place_meeting(x, y+1, obj_solid)) {
    V_SPEED += CONST_GRAVITY;
} else {
    V_SPEED = 0;
    
    //use friction
    apply_friction(CONST_ACCEL);
}

direction_move_bounce(obj_solid);

// Change back to move state
if (alarm[0] == room_speed) { // if 1 second passed, give movement
    image_blend = c_white;
    
    if (PlayerStats.hp <= 0) {
        PlayerStats.sapphires = floor(PlayerStats.sapphires/2);
        PlayerStats.hp = PlayerStats.maxhp;
        if (audio_is_playing(snd_boss_music))
            audio_stop_sound(snd_boss_music);
        if (audio_is_playing(snd_victory))
            audio_stop_sound(snd_victory);
        room_restart();
    }
    state = move_state;
}


