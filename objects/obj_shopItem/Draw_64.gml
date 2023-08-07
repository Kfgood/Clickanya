if (!collision_point(mouse_x, mouse_y, self, false, false) || !unlocked) return;

var num = convertToDigit(waterDrainRate * drainRateModifiers);
num[1] += waterDrainRateDigit;
var numTot = convertToDigit(waterDrainRate * drainRateModifiers * itemCount);
numTot[1] += waterDrainRateDigit;

num = digitToExpanded(num[0], num[1]);
numTot = digitToExpanded(numTot[0], numTot[1]);

var drawString = string("Name: {0}\nCount: {1} L\nDrain Rate: {2} L/s\nTotal Drain Rate: {3} L/s",
	itemName, itemCount, num, numTot);

var w = string_width(drawString);
var h = string_height(drawString);

draw_rectangle_color(mouse_x, mouse_y + 16, mouse_x + w, mouse_y + h + 16, c_grey, c_grey, c_grey, c_grey, false);

draw_text(mouse_x, mouse_y + 16, drawString);

