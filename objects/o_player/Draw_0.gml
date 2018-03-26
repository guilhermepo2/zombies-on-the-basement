/// @description Draw Police

draw_self();

surface_set_target(o_fog.s_fog_);
draw_clear(c_black);
gpu_set_blendmode(bm_src_color);
draw_sprite_ext(s_light, 0, x / o_fog.res_, y / o_fog.res_, .3 + random_var_, .3 + random_var_,0, 0, 1); 
gpu_set_blendmode(bm_normal);
surface_reset_target();
