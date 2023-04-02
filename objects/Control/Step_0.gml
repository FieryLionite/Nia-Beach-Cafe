//global.naked is set with the top left button
naked = global.naked;

//shake camera if burping
if (audio_is_playing(burp_long1) or
	audio_is_playing(burp_long2) or
	audio_is_playing(burp_long3) or
	audio_is_playing(burp_long4) or
	audio_is_playing(burp_long5)){
	rr = 3;
	camera_set_view_pos(view_camera[0], round(random_range(-rr,rr)), round(random_range(-rr,rr)));	
}else{
	camera_set_view_pos(view_camera[0], 0, 0);	
}

//heavy breathing if big belly
if (belly_size > 14 and !TapedMouth.visible and !open_mouth){
	if (!audio_is_playing(heavy_breath))
		audio_play_sound(heavy_breath, 1, 0, 2);
}else if (audio_is_playing(heavy_breath))
	audio_stop_sound(heavy_breath);

//if belly has just increased in size and large enough then play the sound of balloon being stretched
if (floor(last_bsize) != floor(belly_size)){
	last_bsize = floor(belly_size);
	if (floor(belly_size) == sprite_get_number(sprBelly)-2)
		audio_play_sound(sndBallloonRub,0,0);
}	

belly_size = clamp(belly_size, 0, sprite_get_number(sprBelly)-1);

if (wind <= 0){
	wind_speed = 0;
	if (floor(random(300))==0){
		audio_sound_gain(sndWind, 0.5, 400);
		wind = random_range(120, 400);
		wind_speed = random_range(0.2,0.35);
	}
}else{
	
}
	
//hair flutter in the wind
image_speed += (wind_speed - image_speed)/10;
if (image_speed <= 0.025)
	image_index = 0;

//random blink
if (blinking < -50 and floor(random(300))==0)
	blinking = 10;
	
blinking --;
if (wind > 0) {
	wind --;
	if (wind <= 0)
		audio_sound_gain(sndWind, 0, 300);
}

