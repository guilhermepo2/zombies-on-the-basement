/// @description Initializing Zombie
initialize_movement_entity(1, .5);
speed_ = .35;

moan_distance_ = 300;
aware_distance_ = 120;
chasing_distance_ = 100;
attack_distance_ = 10;

enum zombie_state {
	lurking_around,
	aware,
	chasing_player,
	attacking,
	dead
}

direction_ = random(360);

starting_state_ = zombie_state.lurking_around;
state_ = starting_state_;

alarm[1] = random_range(1, 2) * 30;

// Lookup Table?