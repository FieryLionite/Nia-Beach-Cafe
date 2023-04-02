if (!dragging and (x != xstart or y != ystart)){
	x += (xstart-x)/5;
	y += (ystart-y)/5;
}

if (dragging){
	x = mouse_x;
	y = mouse_y;
}