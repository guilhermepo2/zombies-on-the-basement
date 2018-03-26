/// @description Destroy Zombie

with (other) {
	audio_play_sound(zombie_roar, 9, false);
	global.zombies_killed += 1;
	instance_destroy();
}