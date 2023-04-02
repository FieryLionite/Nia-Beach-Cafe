//trigger a laugh

Control.open_mouth = 45;
laugh = asset_get_index("laugh"+string(irandom(7)+1));
audio_play_sound(
	laugh, 1,0,5
);
