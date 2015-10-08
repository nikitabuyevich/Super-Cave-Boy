/// exit_state 
if (image_alpha > 0) {
    image_alpha -= 0.25;
} else {
    if (PlayerStats.stoptime == false) {
        room_goto_next();    
    } else {        
        game_restart();
    }
}
