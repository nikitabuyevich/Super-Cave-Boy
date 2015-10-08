/// ledge_grab_state();

if (down) {
    state = move_state;
}

if (up) {
    state = move_state;
    V_SPEED = JUMP_H;
}
