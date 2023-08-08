
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

var calMax = maxCost;
var calCost = cost;
var calCount = 1;

if (keyboard_check(vk_control)) {
	calCount = 10;
	calMax *= 10;
	calCost = cost10;
}
else if (keyboard_check(vk_shift)) {
	calCount = 100;
	calMax *= 100;
	calCost = cost100;
}

var maxC = string("\nMax Cost: {0}", calMax);
var costS = string("Cost:\n   {0}", digitToExpanded(calCost[0], calCost[1]));

printString = string("{0}\n\nBuy Count: {1}{2}\n{3} L", printString, calCount, maxCost > 0 ? maxC : "", costS);



draw_text_color(self.x + sprite_width / 2, self.y + 10, printString, c_black, c_black, c_black, c_black, 1);