/// @description Draw The Shot
gpu_set_blendmode(bm_add);
draw_set_alpha(image_alpha);

draw_line_width_color(start_x_, start_y_, x, y, 2, c_dkgray, c_white );

gpu_set_blendmode(bm_normal);
draw_set_alpha(1);