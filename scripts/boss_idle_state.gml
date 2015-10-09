///boss_idle_state()
var dis = point_distance(x, y, obj_player.x, obj_player.y);

if (!atboss) {
    audio_emitter_gain(audio_em, 0.5);
    audio_play_sound_on(audio_em, snd_pre_boss, true, 10);
    
    atboss = true;
}

if (dis <= 128) {
    state = boss_lift_state;
    
    audio_stop_sound(snd_pre_boss);
    
    if (!audio_is_playing(snd_music)) {
        audio_emitter_gain(audio_em, 0.2);
        audio_play_sound_on(audio_em, snd_boss_music, true, 10);
    }
} 
