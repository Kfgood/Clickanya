/// @description Insert description here
// You can write your code in this editor



if (mouse_x > self.x && mouse_x < self.x + sprite_get_width(sprite)
	&&
	mouse_y > self.y && mouse_y < self.y + sprite_get_height(sprite)) {
	var ls = string(upgradeMul*100) + "% L/s"
	if (forClicks) {
		ls = string(upgradeMul) + "% of L/s";
	}
	
	
	var descriptionText = string("{0}\n+{1}\nCost: {2} L", upgradeName, ls, digitToExpanded(cost[0], cost[1]));
	
	
	
	draw_rectangle_color(self.x, self.y + sprite_get_height(sprite), self.x + string_width(descriptionText), self.y + sprite_get_height(sprite) + string_height(descriptionText), c_grey, c_grey, c_grey, c_grey, false)
	draw_text(self.x, self.y + sprite_get_height(sprite), descriptionText);
	
}




