/// @description Fog Init

depth = -999

res_ = 10;
s_fog_ = surface_create(room_width / res_, room_height / res_);
surface_set_target(s_fog_);
draw_clear(c_black);
surface_reset_target();
