/// @description Chasing Player

if(point_distance(x, y, o_player.x, o_player.y) > aware_distance_) {
	state_ = zombie_state.lurking_around;
}

var _player_direction = point_direction(x, y, o_player.x, o_player.y);
var _x_move = lengthdir_x(1, _player_direction);
var _y_move = lengthdir_y(1, _player_direction);

move(_x_move * 0.25, _y_move * 0.25);