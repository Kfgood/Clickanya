if (collision_point(mouse_x, mouse_y, self, false, false)) {
	increaseWaterDrained(global.initialClickDrainRate, global.initialClickDrainRateDigit);
	if (!clicked) clicked = true;
}