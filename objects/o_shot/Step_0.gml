/// @description Shot Step

if (image_alpha > 0) {
	image_alpha -= .3;
} else {
	instance_destroy();
}