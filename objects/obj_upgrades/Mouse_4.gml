if (!purchased && visible && decreaseWaterDrained(cost[0], cost[1]) >= 0) {
	
	if (forClicks) {
		purchased = true;
		global.clickRateMul += upgradeMul / 100;
		if (global.useCursor) {
			window_set_cursor(cr_none);
			cursor_sprite = global.cursorSprites[tier];
		}
		else {
			obj_cursor.oldCursorSprite = global.cursorSprites[tier];
		}
	}
	else if (tiedObj){
		purchased = true;
		tiedObj.drainRateModifiers += upgradeMul;
		tiedObj.upgrade = self;
		tiedObj.upgradeTier++;
		
		with (tiedObj) {
			drainPerTick = convertToDigit(waterDrainRate * itemCount * drainRateModifiers / 60);
			drainPerTick[1] += waterDrainRateDigit;
		}
		
		
	}
	
	
}