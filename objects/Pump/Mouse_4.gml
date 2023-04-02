if (instance_exists(Teddy))
	exit;

on = !on;

if (on) audio_play_sound(sndPump, 0, 1);
	else audio_stop_sound(sndPump);