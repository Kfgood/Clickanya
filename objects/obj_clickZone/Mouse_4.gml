if (collision_point(mouse_x, mouse_y, self, false, false)) {
	
	if (global.clickRateMul == 0) {
		
		increaseWaterDrained(global.initialClickDrainRate, global.initialClickDrainRateDigit);
	
		instance_create_depth(mouse_x - 16, mouse_y - 16, 0, obj_floatAwayText, {clickPoints : [global.initialClickDrainRate, global.initialClickDrainRateDigit]});
	}
	else {
		var sum = [0, 0];
	
		with (obj_shopItem) {
			sum = addDigitNumber(sum[0], sum[1], drainPerTick[0], drainPerTick[1]);
		}
	
		sum[0] *= global.clickRateMul;
	
		sum = addDigitNumber(sum[0], sum[1], global.initialClickDrainRate, global.initialClickDrainRateDigit);
	
		var temp = sum[0];
		temp = convertToDigit(temp);
		sum[0] = temp[0];
		sum[1] += temp[1];
	
		increaseWaterDrained(sum[0], sum[1]);
	
		instance_create_depth(mouse_x - 16, mouse_y - 16, 0, obj_floatAwayText, {clickPoints : sum});
	}
	if (!clicked) clicked = true;
}