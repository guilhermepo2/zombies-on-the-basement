/// @description DRAW GUI
// Draw The Ammo and... that's it?

var _gui_width = display_get_gui_width();
var _gui_height = display_get_gui_height();

draw_text(4, 4, "Ammo: " + string(global.player_ammo));
draw_text(4, 24, "Basement " + string(global.current_level));

var _text;

if(global.zombies_killed == 0) _text = "no zombies killed"
else if (global.zombies_killed == 1) _text = "1 zombie killed"
else _text = (string(global.zombies_killed) + " zombies killed");

draw_text(4, 44, _text);
