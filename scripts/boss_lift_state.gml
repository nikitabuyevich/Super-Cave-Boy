///boss_lift_state()
image_index = 1;

if (V_SPEED >= -16)
    V_SPEED -= 0.5;

scr_move(obj_solid);

if (place_meeting(x, y-16, obj_solid)) {
    V_SPEED = 0;
    state = boss_chase_state;
}

