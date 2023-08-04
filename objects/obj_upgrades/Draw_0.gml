if (purchased) return;

if (sprite != -1) {
	draw_sprite(sprite, 0, self.x, self.y);
}
else
	draw_self();