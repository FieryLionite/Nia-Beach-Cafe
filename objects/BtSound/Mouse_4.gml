global.sound = !global.sound;
image_index = global.sound;

if (global.sound){
	audio_set_master_gain(0,0);
}else{
	audio_set_master_gain(0,1);	
}