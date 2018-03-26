/// @description Lurking Around

var _x_speed = lengthdir_x(speed_, direction_);
var _y_speed = lengthdir_y(speed_, direction_);

if _x_speed != 0 {
    image_xscale = sign(_x_speed);
}

if(alarm[1] <= 0) {
	alarm[1] = 30 * random_range(1,3);
}

if(instance_exists(o_player)) {
	if(point_distance(x, y, o_player.x, o_player.y) < aware_distance_) {
		audio_play_sound(zombie_breath, 5, false);
		state_ = zombie_state.aware;
	}
}

move(_x_speed ,_y_speed);