alarm[0] = 120;

if (belly_size <= 7){}
	//audio_play_sound(
	//	asset_get_index("calm_breath"+string(irandom(5)+1)), 0, 0
	//)
else if (!TapedMouth.visible) and belly_size <= 14 {
	laugh = asset_get_index("calm_breath"+string(irandom(5)+1));
	//audio_sound_gain(laugh, 1.2,0);
	audio_play_sound(
		laugh, 1, 0, 3.5
	)
	
	if (belly_size >= 14)
		alarm[0] = 80;
	//audio_play_sound(
	//	laugh, 1, 0
	//)
}