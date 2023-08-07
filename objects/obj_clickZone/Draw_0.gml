/// @description Insert description here
// You can write your code in this editor

if (!clicked) {
	var str = "Click Here";
	draw_text_transformed_color(self.x + sprite_width / 2 - string_width(str)*2.5, self.y + room_height / 2, str, 5, 5, 0, c_white, c_white, c_white, c_white, clickedAlpha)
	clickedAlpha += clickedSign * 0.5 / 60;
	if (clickedAlpha < 0 || clickedAlpha > 1)
		clickedSign *= -1;
}
else {
	var drainedWater = digitToExpanded(global.drainedWater, global.drainedWaterDigit) + " L";

	draw_set_alpha(0.5);

	draw_rectangle_color(self.x + sprite_width / 2 - string_width("999.99Sxa L"), self.y + string_height("999.99Sxa L")*2,
		self.x + sprite_width / 2 + string_width("999.99Sxa L"), self.y + string_height("999.99Sxa L")*4,
		c_grey, c_grey, c_grey, c_grey, false);

	draw_set_alpha(1);

	draw_text_transformed_color(self.x + sprite_width / 2 - string_width(drainedWater), self.y + string_height(drainedWater)*2, drainedWater, 2, 2, 0, c_black, c_black, c_black, c_black, 1)
}