/// aapply_friction(amount)
var amount = argument0;

if (H_SPEED != 0) {
    if (abs(H_SPEED)-amount > 0) {
        H_SPEED -= amount*image_xscale;
    } else {
        H_SPEED = 0;
    }
}
