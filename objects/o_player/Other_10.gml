/// @description CAN MOVE STATE

image_speed = 0.25;
var spd = 3;
var hspd = (keyboard_check(vk_right) - keyboard_check(vk_left)) * spd;
var vspd = (keyboard_check(vk_down) - keyboard_check(vk_up)) * spd;

// Get input and move
if(keyboard_check(vk_right)) { 
    direction_facing_ = dir.right;
	image_xscale = 1;
}

if(keyboard_check(vk_down)) {
    direction_facing_ = dir.down;
}

if (keyboard_check(vk_up)) {
    direction_facing_ = dir.up;
}

if(keyboard_check(vk_left)) {
    direction_facing_ = dir.left;
	image_xscale = -1;
}

if(keyboard_check_pressed(ord("E"))) {
    image_index = 0;
    state_ = player.aiming;
}

move(hspd, vspd);
