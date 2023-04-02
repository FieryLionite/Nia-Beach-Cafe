draw_self();
//draw hand on top
if (mouse_check_button(mb_left))
	draw_sprite(sprHand, 0, mouse_x+wave(-25,25, 1.5, 0), mouse_y);