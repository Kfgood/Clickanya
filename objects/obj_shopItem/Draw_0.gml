var printString = itemName;
var c = c_white;

draw_set_alpha(0.5);

draw_rectangle_color(self.x, self.y - 32, self.x + sprite_width, self.y + sprite_height, c_grey, c_grey, c_grey, c_grey, false);

draw_set_alpha(1);

if (!unlocked) {
	printString = "???";
	c = c_black;
}

if (unlockedUpgrades >= 0) {
	draw_text_color(self.x, self.y - 32 + string_height("Upgrades: ")/2, "Upgrades: ", c_black, c_black, c_black, c_black, 1);
}

if (sprite > 0) {
	draw_sprite_ext(sprite, 0, self.x, self.y, 1, 1, 0, c, 1);
}

printString = string("{0}{1}\n\nCost:\n   {2} L\nCost 10:\n   {3} L", printString, maxCost > 0 ? string("\nMax Cost: {0}", maxCost) : "", digitToExpanded(cost[0], cost[1]), digitToExpanded(cost10[0], cost10[1]));

draw_text_color(self.x + sprite_width / 2, self.y + 10, printString, c_black, c_black, c_black, c_black, 1);