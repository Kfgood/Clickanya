var dy = 0;

if (mouse_check_button_released(1)) pressed = false;

if (mouse_check_button_pressed(1) &&
	mouse_x > sbStartingWidth && mouse_x < sbEndingWidth)
	if (mouse_y > yy && mouse_y < yy + 32*yScale) {
	
		pressed = true;
		clickY = mouse_y;
	}
	else if (mouse_y > 0 && mouse_y < 32) {
		dy -= 30;
	}
	else if (mouse_y > sbEndingHeight && mouse_y < room_height) {
		dy += 30;
	}

if (mouse_wheel_down())
	dy += 10;
else if (mouse_wheel_up())
	dy -= 10;

if (pressed) {
	dy = mouse_y - yHalfWay - yy;
}

if (dy + yy < sbStartingHeight) dy = sbStartingHeight - yy;
if (dy + yy > sbEndingHeight - yHalfWay*2) dy = sbEndingHeight - yHalfWay*2 - yy;

var _y = dy;
with (obj_displayObj) {
	y -= _y;
}

with (obj_upgrades) {
	if (!forClicks)
		y -= _y;
}

with (obj_shopItem) {
	y -= _y;
}

yy += dy;
