draw_sprite(sprBaseFull, 0, 0,0);

//draw ocean waves
shader_set(shdWater);
shader_set_uniform_f(uTime, current_time/3);
var tex = sprite_get_texture(sprSea, 0);
shader_set_uniform_f(uTexel, texture_get_texel_width(tex), texture_get_texel_height(tex));
draw_sprite(sprSea, 0, 0, 0);
shader_reset();

if (!naked)
	draw_sprite(sprBase, 0, 0,0);
else
	draw_sprite(sprBaseNaked, 0, 0,0);

//clothed breathing
breathe_rate = 3;
if (belly_size >= 7)
	breathe_rate = 1.5;
if (belly_size >= 14)
	breathe_rate = 1.1;
	
if (naked)
	breathe_rate *= 0.7;
	
breathe = wave(1, 0, breathe_rate, 0);

balpha = 0;
if (1-breathe > 0.6)
	balpha = 1;
	
if (!instance_exists(Teddy)){
	draw_sprite(sprPump, 0, Pump.x, Pump.y);
}

//draw belly underneath top
if (!naked)
	draw_sprite(sprBellyNaked, belly_size, 0,0);
else
	draw_sprite(sprBellyNaked, belly_size, 0,0);

if (belly_size <= 2){
	//draw upper stomach expanding when breathing (clothed)
	if (!naked)
		draw_sprite_ext(sprBreathe2b, 0, 0, 0, 1, 1, 0, c_white, 1-breathe);
	//draw pump
	if (!instance_exists(Teddy))
		draw_sprite(sprPump, 0, Pump.x, Pump.y);
}

//if clothed then draw the yellow top, otherwise draw naked breasts
if (!naked){
	draw_sprite_ext(sprBreathe1, 0, 0, 0, 1, 1, 0, c_white, breathe);
	draw_sprite_ext(sprBreathe2, 0, 0, 0, 1, 1, 0, c_white, 1-breathe);
}else{
	breathe_counter += (3-breathe_rate)/20;
	draw_sprite_ext(sprBreatheNaked, breathe_counter, 0, 0, 1, 1, 0, c_white, 1);
}

//draw belly on top of naked chest
if (naked)
	draw_sprite(sprBellyNaked, belly_size, 0,0);


if (open_mouth > 0){
	draw_sprite(sprExTalk, 0, 0, 0);
}

//depending on the belly size, her facial expression change
if (belly_size > 7){
	aIdx = 0;
	if (open_mouth > 0 and !TapedMouth.visible)
		aIdx = 1;
	if (belly_size > 14)
		aIdx += 2;
	draw_sprite(sprExAhegao, aIdx, 0, 0);
}

if (blinking > 0){
	closed = 0;
	if (belly_size > 7)
		closed = 1;
	if (belly_size > 14){
		closed = 2;	
	}
	draw_sprite(sprExClosed, closed, 0, 0);
}
	

	
draw_self();

//draw hands on top of everything else
if (mouse_check_button(mb_left) && !instance_position(mouse_x, mouse_y, DuctTape))
	draw_sprite(sprHand, 0, mouse_x+wave(-25,25, 1.5, 0), mouse_y);
	
open_mouth--;