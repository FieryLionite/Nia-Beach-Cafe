if (visible){
	visible = false;
	audio_play_sound(sndTape, 0, 0);
	
	//burp when duct tape is taken off mouth
	if (Control.belly_size >= 12){
		audio_play_sound(asset_get_index("burp_long"+string(irandom(4)+1)),0,0, 0.7);
		Control.open_mouth = 90;
		Control.blinking = 100;
		Belly.alarm[1] = 120;
		Control.belly_size = min(11.9, Control.belly_size-2);
	}
}