/// @description AIMING STATE

if(keyboard_check_pressed(ord("Q"))) {
    image_index = 0;
    state_ = player.can_move;
}

if(keyboard_check_pressed(ord("E"))) {
    image_index = 0;
    state_ = player.shooting;
}
