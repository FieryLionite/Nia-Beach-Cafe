//perform a burp, long or short burp depend on current belly size
//after burping, will also laugh
if (!(instance_position(mouse_x,mouse_y,id) && mouse_check_button(mb_left)) || Control.belly_size <= 0)
	exit;
	
if (Control.open_mouth <= 0){
	if (Control.belly_size > 4){
		audio_play_sound(asset_get_index("burp_long"+string(irandom(3)+1)),0,0, 0.5);
		Control.open_mouth = 90;
		Control.blinking = 100;
		//always laugh if long burp
		alarm[1] = 150;
	}else{
		audio_play_sound(choose(burp1,burp2,burp3,burp4,burp5), 0, 0, 0.7);
		Control.open_mouth = 45;
		//small chance to laugh if small burp
		if (irandom(1)==0)
			Belly.alarm[1] = 60;
	}
}

//check back in 6 or so seconds to see if the player is still rubbing belly, and burp again if so
//alarm[0] = 220;
