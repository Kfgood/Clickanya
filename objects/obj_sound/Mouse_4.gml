
if (global.muted) {
	audio_play_sound(sound, 0, true);
}
else {
	audio_stop_all();
}

global.muted = !global.muted;