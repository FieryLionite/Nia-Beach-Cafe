r = 1;
if (on){
	threshold = sprite_get_number(sprBelly)-5;
	if (TapedMouth.visible)
		threshold += 3;
	if (Control.belly_size <= threshold){
		//Control.belly_size += 0.005;
		
		Control.belly_size += 0.005;
	}else if (!TapedMouth.visible){
		if (floor(random(120))==0 and  Control.open_mouth <= 0){
			audio_play_sound(choose(burp1,burp2,burp3,burp4,burp5), 0, 0);
			Control.open_mouth = 45;
			if (irandom(1)==0)
				Belly.alarm[1] = 60;
		}
	}else{
		if (floor(random(200))==0 and 
			!audio_is_playing(fart1) and
			!audio_is_playing(fart2) and
			!audio_is_playing(fart3) and
			!audio_is_playing(fart4) and
			!audio_is_playing(sndBallloonRub)){
			audio_play_sound(choose(fart1,fart2,fart3,fart4), 0, 0);
			Control.blinking = 60;
		}
	}
	
	x = random_range(-r,r);	
	y = random_range(-r,r);
}