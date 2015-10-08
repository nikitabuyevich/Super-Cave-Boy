///boss_smash_state();

if (!place_meeting(x, y+1, obj_solid)) {
    if (V_SPEED < 16) {
        V_SPEED += 1;
    }
    
    scr_move(obj_solid);
} else {
    state = boss_stall_state;
    alarm[0] = room_speed;
    audio_play_sound(snd_step, 8, false);
    
    if (place_meeting(x, y, Lava)) {
        hp -= 1;
        audio_play_sound(snd_snake, 9, false);
    }
}
