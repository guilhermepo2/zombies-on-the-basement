/// @description Aware

if not instance_exists(o_player) state_ = zombie_state.lurking_around;

if(point_distance(x, y, o_player.x, o_player.y) > aware_distance_) {
	state_ = zombie_state.lurking_around;
}

var dir = point_direction(x,y, o_player.x, o_player.y)
image_xscale = sign(lengthdir_x(1, dir));

if(point_distance(x,y, o_player.x, o_player.y) < chasing_distance_) {
	state_ = zombie_state.chasing_player;
}
