/// @description DRAW GUI
// Draw The Ammo and... that's it?

var _gui_width = display_get_gui_width();
var _gui_height = display_get_gui_height();

if(player_alive_) {
	draw_text(4, 4, "Ammo: " + string(global.player_ammo));
	draw_text(4, 24, "Basement " + string(global.current_level));

	var _text;

	if(global.zombies_killed == 0) _text = "no zombies killed"
	else if (global.zombies_killed == 1) _text = "1 zombie killed"
	else _text = (string(global.zombies_killed) + " zombies killed");

	draw_text(4, 44, _text);
} else {
	draw_text(_gui_width / 2 - (string_width("YOU DIED")/2), _gui_height / 2, "YOU DIED");
	var _zombies_text = "Zombies Killed: " + string(global.zombies_killed);
	draw_text(_gui_width / 2 - (string_width(_zombies_text) / 2), _gui_height / 2 + 24, _zombies_text);
}
