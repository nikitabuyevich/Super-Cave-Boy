/// move(collision_object)
var collision_object = argument0;

// Horizontal Collisions
if (place_meeting(x+H_SPEED, y, collision_object)){
    while (!place_meeting(x+sign(H_SPEED), y, collision_object)){
        x += sign(H_SPEED);
    }
    H_SPEED = 0;
}
x += H_SPEED;

// Vertical Collisions
if (place_meeting(x, y+V_SPEED, collision_object)){
    while (!place_meeting(x, y+sign(V_SPEED), collision_object)){
        y += sign(V_SPEED);
    }
    V_SPEED = 0;
}
y += V_SPEED;
