/// @description SHOOTING STATE

if(global.player_ammo > 0) {
	image_speed = 0.5;
	var temp_dir = direction_facing_ * 90;
	
	// Find Target
	var temp_x = x;
	var temp_y = y;
	
	if(direction_facing_ == dir.right) {
		temp_x += 2;
		temp_y += 2;
	} else if(direction_facing_ == dir.left) {
		temp_x -= 2;
		temp_y += 2;
	} else if(direction_facing_ == dir.up) {
		temp_x -= 1;
	} else if(direction_facing_ == dir.down) {
		temp_x -= 1;
	}
	
	var start_x = temp_x;
	var start_y = temp_y;
	var collision = (position_meeting(temp_x, temp_y, o_zombie));


	if animation_hit_frame(image_number - 1) {
		audio_play_sound(gun_shot, 10, false);
		global.player_ammo -= 1;
		
		while(!collision && distance_to_point(temp_x, temp_y) < room_width) {
			temp_x += lengthdir_x(4, temp_dir);
			temp_y += lengthdir_y(4, temp_dir);
			collision = (position_meeting(temp_x, temp_y, o_zombie));
		}
	
		var shot = instance_create_layer(temp_x, temp_y, "Instances", o_shot);
		shot.start_x_ = start_x;
		shot.start_y_ = start_y;

		state_ = player.aiming;
	}

} else {
	audio_play_sound(gun_empty, 10, false);
	state_ = player.aiming;
}