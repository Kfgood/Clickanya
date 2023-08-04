/// @description Insert description here
// You can write your code in this 

if (collision_point(mouse_x, mouse_y, self, false, false)) {
	// needs to be a tad more complex to handle > E17 and powers can easily scale it above and to skip over E18 quickly
	var added = 0;
	var temp;
	if (keyboard_check(vk_control)) {
		var cost = calculateCost(itemCount, growthFactor, 10,
			baseCost, baseCostDigit, growthFactorConstant, growthFactorConstantDigit);
		
		var bought = global.maxItem.itemCount >= maxCost * 10 && decreaseWaterDrained(cost[0], cost[1]) >= 0;
		
		if (!bought) return;
		
		global.maxItem.itemCount -= maxCost * 10;
		
		added = 10;
		itemCount += 10;
	}
	else if (keyboard_check(vk_shift)) {
		//cost E costDigit = base E baseDigit + (growthRate E growthRateDigit) ^ itemCount
		//(global.drainedWater + 10^(global.drainedWaterDigit)) - base - 10^(baseDigit) = growthRate ^ itemCount

		var cost = calculateCost(itemCount, growthFactor, 100,
			baseCost, baseCostDigit, growthFactorConstant, growthFactorConstantDigit);
			
		var bought = global.maxItem.itemCount >= maxCost * 100 && decreaseWaterDrained(cost[0], cost[1]) >= 0;
		
		if (!bought) return;
		
		global.maxItem.itemCount -= maxCost * 100;

		added = 100;
		itemCount += 100;
	}
	else {
		
		var cost = calculateCost(itemCount, growthFactor, 1,
			baseCost, baseCostDigit, growthFactorConstant, growthFactorConstantDigit);
		
		var bought = global.maxItem.itemCount >= maxCost && decreaseWaterDrained(cost[0], cost[1]) >= 0;
		
		if (!bought) return;
		
		global.maxItem.itemCount -= maxCost;
		
		added = 1;
		itemCount += 1;

	}
	
	for (var i = 0; i < added; i++) {
		var name = "";
		if (itemName == "Max") {
			name = getRandomMaxName();
			array_push(global.usedMax, name);
		}
		var yC = self.y + sprite_get_height(displaySprite) * displayCurrYIndex;
		var yX = room_width / 3 + sprite_get_width(displaySprite) * displayCurrXIndex;
		if (yX > self.x - sprite_get_width(displaySprite) - 32) return;
		
		var newItem = spawnNewDisplay(displaySprite, yX, yC, name);
		
		if (itemName == "Max") {
			if (name == "Max" || name == "")
				array_push(global.genericMax, newItem);
			else
				struct_set(global.max, name, newItem);
		}
		
		if (yC + sprite_get_height(displaySprite) > self.y + sprite_height - 64) {
			displayCurrYIndex = 1;
			displayCurrXIndex++;
		}
		else
			displayCurrYIndex++;
	}
	
	if (upgradeIndex < array_length(upgrades) &&  itemCount > upgrades[upgradeIndex].requirementCount) {
		instance_activate_object(upgrades[upgradeIndex++]);
	}
}