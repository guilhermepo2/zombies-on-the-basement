/// @description Init Level
randomize();

var _wall_map_id = layer_tilemap_get_id("WallTiles");
width_ = room_width div CELL_WIDTH;
height_ = room_height div CELL_HEIGHT;
grid_ = ds_grid_create(width_, height_);
enemies_ammount_ = 15;
ds_grid_set_region(grid_, 0, 0, width_, height_, VOID);

// Create the Controller
var _controller_x = width_ div 2;
var _controller_y = height_ div 2;
var _controller_direction = irandom(3);
var _steps = 400;

// Player Starting Position
var _player_start_x = _controller_x * CELL_WIDTH + CELL_WIDTH / 2;
var _player_start_y = _controller_y * CELL_HEIGHT + CELL_HEIGHT / 2;
instance_create_layer(0, 0, "Instances", o_fog);
if not instance_exists(o_game) instance_create_layer(0, 0, "Instances", o_game);
instance_create_layer(_player_start_x, _player_start_y, "Instances", o_player);

var _direction_change_odds = 1;
var _enemies_spawned = 0;

repeat (_steps) {
	grid_[# _controller_x, _controller_y] = FLOOR;
	
	// Add some enemies
    var odds = 10;
    var enemy_x = _controller_x * CELL_WIDTH  + CELL_WIDTH/2;
    var enemy_y = _controller_y * CELL_HEIGHT + CELL_HEIGHT/2;
    var _enemy = o_zombie;
    if (point_distance(enemy_x, enemy_y, o_player.x, o_player. y) > 80 && irandom(odds) == odds && _enemies_spawned < enemies_ammount_) {
        instance_create_layer(enemy_x, enemy_y, "Instances", _enemy);
		_enemies_spawned += 1;
   }
	
	if (irandom(_direction_change_odds) == _direction_change_odds) {
		_controller_direction = irandom(3);
	}
	
	var _x_direction = lengthdir_x(1, _controller_direction * 90);
	var _y_direction = lengthdir_y(1, _controller_direction * 90);
	_controller_x += _x_direction;
	_controller_y += _y_direction;
	
	if(_controller_x < 2 || _controller_x >= width_ - 2) {
		_controller_x += -_x_direction*2;
	}
	
	if(_controller_y < 2 || _controller_y >= height_ -2) {
		_controller_y += -_y_direction*2;
	}
}

var _temp_x = irandom(width_);
var _temp_y = irandom(height_);

while(grid_[# _temp_x, _temp_y] != FLOOR || point_distance(_temp_x, _temp_y, o_player.x, o_player.y) < 50) {
	var _temp_x = irandom(width_);
	var _temp_y = irandom(height_);
}
show_debug_message("Exit created at: " + string(_temp_x) + " " + string(_temp_y));
instance_create_layer(_temp_x * CELL_WIDTH, _temp_y * CELL_HEIGHT, "Instances", o_exit);

// There's a chance of 1 in 10 of having an ammo on the basement
var _ammo_odds = 10;
if(irandom(_ammo_odds) == _ammo_odds) {
	audio_play_sound(gun_reload, 5, false);
	_temp_x = irandom(width_);
	_temp_y = irandom(height_);
	
	while(grid_[# _temp_x, _temp_y] != FLOOR || point_distance(_temp_x, _temp_y, o_player.x, o_player.y) < 50) {
		_temp_x = irandom(width_);
		_temp_y = irandom(height_);
	}
	
	instance_create_layer(_temp_x * CELL_WIDTH + CELL_WIDTH / 2, _temp_y * CELL_HEIGHT + CELL_HEIGHT / 2, "Instances", o_ammo);
}

for (var _y = 1; _y < height_ - 1; _y++) {
	for( var _x = 1; _x < width_ - 1; _x++) {
		if(grid_[# _x, _y] != FLOOR) {
			var _north_tile = grid_[# _x, _y-1] == VOID;
			var _west_tile = grid_[# _x-1, _y] == VOID;
			var _east_tile = grid_[# _x+1, _y] == VOID;
			var _south_tile = grid_[# _x, _y+1] == VOID;
			
			var _tile_index = NORTH * _north_tile + WEST*_west_tile+EAST*_east_tile+SOUTH*_south_tile +1;
			if (_tile_index == 1) {
				grid_[# _x, _y] = FLOOR;
			}
		}
	}
}



for (var _y = 1; _y < height_ - 1; _y++) {
	for( var _x = 1; _x < width_ - 1; _x++) {
		if(grid_[# _x, _y] != FLOOR) {
			var _north_tile = grid_[# _x, _y-1] == VOID;
			var _west_tile = grid_[# _x-1, _y] == VOID;
			var _east_tile = grid_[# _x+1, _y] == VOID;
			var _south_tile = grid_[# _x, _y+1] == VOID;
			
			var _tile_index = NORTH * _north_tile + WEST*_west_tile+EAST*_east_tile+SOUTH*_south_tile +1;
			tilemap_set(_wall_map_id, _tile_index, _x, _y);
		}
	}
}
