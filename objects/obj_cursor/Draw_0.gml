
if (!global.clickRateUpgrades[0].purchased) return;

if (global.useCursor) {
	draw_sprite(spr_cursor, 0, self.x, self.y);
}
else {
	draw_sprite(spr_noCursor, 0, self.x, self.y);
}
