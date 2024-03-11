main_sound_effects = audio_emitter_create()
normal_sound_effects = audio_emitter_create()
low_snd = audio_emitter_create()
music_e = audio_emitter_create()

function play_sound(_snd,_var) constructor{
	audio_emitter_pitch(main_sound_effects,(random_range(-_var,_var)+1))
	audio_play_sound_on(main_sound_effects,_snd,false,1)
}

function play_sound_normal(_snd){
	audio_play_sound_on(normal_sound_effects,_snd,false,1)
}

function play_sound_low(_snd){
	audio_emitter_pitch(low_snd,0.6)
	audio_play_sound_on(normal_sound_effects,_snd,false,1)
}

function switch_music(){
	audio_stop_sound(snd_music)
	audio_play_sound_on(music_e,snd_music_boss,true,0)
}

audio_play_sound_on(music_e,snd_music,true,0)
