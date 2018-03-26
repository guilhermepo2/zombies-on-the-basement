global.one_second = game_get_speed(gamespeed_fps);
global.player_ammo = 3;
global.current_level = 1;
global.zombies_killed = 0;
player_alive_ = true;

audio_play_sound(bg_sound, 10, true);
persistent = true;