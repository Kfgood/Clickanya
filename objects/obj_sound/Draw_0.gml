
if (!global.muted) {
	draw_sprite(spr_audio, 0, self.x, self.y);
}
else {
	draw_sprite(spr_mute, 0, self.x, self.y);
}
