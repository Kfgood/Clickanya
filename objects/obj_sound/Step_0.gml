/// @description Insert description here
// You can write your code in this editor

if (sound != clickanyaDistort)
	if (room == rm_gameRoom)
		if (global.items[array_length(global.items) - 1].itemCount > 0) {
			sound = clickanyaDistort;
			if (global.muted == false) {
				audio_stop_all();
				audio_play_sound(sound, 0, true);
			}
		}
