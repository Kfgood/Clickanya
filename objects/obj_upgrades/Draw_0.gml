if (sprite != -1) {
	draw_sprite(sprite, 0, x, y);
}
else
	draw_self();
	
if (purchased) 
	draw_sprite(spr_check, 0, x, y);