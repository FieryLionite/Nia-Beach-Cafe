wind = -1;
wind_speed = 0;
blinking = -1;
image_speed = 0;
belly_size = 0;
open_mouth = -1;

//mute background sounds but do play them
audio_play_sound(sndBeach,0,1);
audio_play_sound(sndWind,0,1);
audio_sound_gain(sndWind, 0, 0);
audio_sound_gain(sndBeach, 0.2, 0);
audio_sound_gain(sndPump, 0.5,0);

//init ocean wave shader
uTime = shader_get_uniform(shdWater, "Time");
uTexel = shader_get_uniform(shdWater, "Texel");

//cached belly size
last_bsize = 0;

alarm[0] = 60;

naked = true;
breathe_counter = 0;