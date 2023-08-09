
if (displayItemName != "")
	if (mouse_x > self.x && mouse_x < self.x + sprite_get_width(sprite)
		&&
		mouse_y > self.y && mouse_y < self.y + sprite_get_height(sprite)) {
		
		var w = string_width(displayItemName);
		var h = string_height(displayItemName);
		
		draw_rectangle_color(mouse_x - w/2, mouse_y + 16, mouse_x + w/2, mouse_y + h + 16, c_grey, c_grey, c_grey, c_grey, false)
		draw_text(mouse_x - w/2, mouse_y + 16, displayItemName);
	}
