if (room == rmMenu)
	image_alpha = ControlPreview.image_alpha;
else{
	//fade away
	if (image_alpha > 0 and !instance_position(mouse_x, mouse_y, id))
		image_alpha *= 0.95;
}