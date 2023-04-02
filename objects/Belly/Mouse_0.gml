if (TapedMouth.visible){
	Control.blinking = 10;
	if (Control.belly_size > 0){
		
		//DISABLED FARTING WHEN RUB BELLY WITH TAPED MOUTH
		/*if (false)
		if (floor(random(80))==0 and 
				!audio_is_playing(fart1) and
				!audio_is_playing(fart2) and
				!audio_is_playing(fart3) and
				!audio_is_playing(fart4) and
				!audio_is_playing(sndBallloonRub)){
				audio_play_sound(choose(fart1,fart2,fart3,fart4), 0, 0);
				Control.blinking = 60;
			}*/
	}
	//if taped mouth then don't laugh or burp
	exit;
}

//player is not rubbing belly if the hand is holding something else
if (DuctTape.dragging)
	exit;

//decrease belly size when belly is rubbed
if(Control.belly_size > 0){
	Control.belly_size -= 0.02;
}
Control.belly_size = max(0, Control.belly_size);

//burp when rub for long enough
warmup++;
if(Control.belly_size > 0 and warmup > 30){
	alarm[0] = 1;
}

if (Control.open_mouth <= 0 and Control.belly_size < 14 ){
	Control.open_mouth = 5;
}	