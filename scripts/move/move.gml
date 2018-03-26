var hspd = argument0;
var vspd = argument1;

x += hspd;

if(hspd > 0) {
	if(grid_place_meeting(self, o_level.grid_)) {
		x = bbox_right&~(CELL_WIDTH-1);
		x -= bbox_right-x;
		hspd = 0;
	}
} else if(hspd < 0) {
	if(grid_place_meeting(self, o_level.grid_)) {
		x = bbox_left&~(CELL_WIDTH-1);
		x += CELL_WIDTH+x-bbox_left;
		hspd = 0;
	}
}

y += vspd;

if (vspd > 0) {
	if(grid_place_meeting(self, o_level.grid_)) {
		y = bbox_bottom&~(CELL_HEIGHT-1);
		y -= bbox_bottom-y;
		vspd = 0;
	}
} else if(vspd < 0) {
	if(grid_place_meeting(self, o_level.grid_)) {
		y = bbox_top&~(CELL_HEIGHT-1);
		y += CELL_HEIGHT+y-bbox_top;
		vspd = 0;
	}
}