/// @description Zombie Step

depth = -y;

if(instance_exists(o_player)) {
	event_user(state_);
} else {
	event_user(zombie_state.lurking_around);
}