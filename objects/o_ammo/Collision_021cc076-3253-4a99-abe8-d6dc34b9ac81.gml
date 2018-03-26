/// @description Gain Ammo!

global.player_ammo += 1;
audio_play_sound(gun_reload, 5, false);
instance_destroy();