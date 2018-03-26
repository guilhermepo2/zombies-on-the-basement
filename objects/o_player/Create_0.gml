/// @description Police Officer Create Event
initialize_movement_entity(.5, 1);

image_speed = 0;
acceleration = .5;
max_speed_ = 1.5;
field_of_view_ = 160

// variable to dynamize fov
random_var_ = sin(random_range(0, .05))
alarm[1] = 10;

shot_delay_ = 3;
alarm[0] = 0;

instance_create_layer(x, y, "Instances", o_camera);

enum player {
	can_move,
	aiming,
	shooting,
	hit
}

enum dir {
	right,
	up,
	left,
	down,
}

starting_state_ = player.can_move;
state_ = starting_state_;
direction_facing_ = dir.right;

// SPRITE LOOKUP TABLE
sprite_[player.can_move, dir.right] = police_idle;
sprite_[player.can_move, dir.up] = police_up_idle;
sprite_[player.can_move, dir.left] = police_idle;
sprite_[player.can_move, dir.down] = police_down_idle;

sprite_[player.aiming, dir.right] = police_aim;
sprite_[player.aiming, dir.up] = police_up_aim;
sprite_[player.aiming, dir.left] = police_aim;
sprite_[player.aiming, dir.down] = police_down_aiming;

sprite_[player.shooting, dir.right] = police_shooting;
sprite_[player.shooting, dir.up] = police_up_shooting;
sprite_[player.shooting, dir.left] = police_shooting;
sprite_[player.shooting, dir.down] = police_down_shooting;

sprite_[player.hit, dir.right] = police_idle;
sprite_[player.hit, dir.up] = police_idle;
sprite_[player.hit, dir.left] = police_idle;
sprite_[player.hit, dir.down] = police_idle;