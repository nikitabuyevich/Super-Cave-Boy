///boss_chase_state()
var dis = point_distance(x, y, obj_player.x, y);
if (dis < sprite_width/2-16 || place_meeting(x-1, y, obj_solid) || place_meeting(x+1, y, obj_solid)) {
    state = boss_smash_state;
    audio_play_sound(snd_jump, 6, false);
    H_SPEED = 0;
} else {
    H_SPEED = ((obj_player.x - x) * 0.05);
}

scr_move(obj_solid);
