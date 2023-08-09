/// @description Insert description here
// You can write your code in this 

if (collision_point(mouse_x, mouse_y, self, false, false)) {
	// needs to be a tad more complex to handle > E17 and powers can easily scale it above and to skip over E18 quickly
	var added = 0;
	var temp;
	if (keyboard_check(vk_control)) {
		
		var bought = global.maxItem.itemCount >= maxCost * 10 && decreaseWaterDrained(cost10[0], cost10[1]) >= 0;
		
		if (!bought) return;
		
		added = 10;
		itemCount += 10;
	}
	else if (keyboard_check(vk_shift)) {
		//cost E costDigit = base E baseDigit + (growthRate E growthRateDigit) ^ itemCount
		//(global.drainedWater + 10^(global.drainedWaterDigit)) - base - 10^(baseDigit) = growthRate ^ itemCount
			
		var bought = global.maxItem.itemCount >= maxCost * 100 && decreaseWaterDrained(cost100[0], cost100[1]) >= 0;
		
		if (!bought) return;

		added = 100;
		itemCount += 100;
	}
	else {
		
		var bought = global.maxItem.itemCount >= maxCost && decreaseWaterDrained(cost[0], cost[1]) >= 0;
		
		if (!bought) return;
		
		added = 1;
		itemCount += 1;

	}
	
	var yC, yX;
	for (var i = 0; i < added; i++) {
		
		
		yC = self.y + sprite_get_height(displaySprite) * displayCurrYIndex;
		yX = room_width / 3 + 64 + sprite_get_width(displaySprite) * displayCurrXIndex;
		if (yX > self.x - sprite_get_width(displaySprite) - 32) {
			consumeMax(maxCost*(added-i), true);
			break;
		}
		
		var name = "";
		if (itemName == "Max") {
			var maxName = getRandomMaxName();
			if (is_string(maxName)) {
				name = maxName;
				array_push(global.usedMax, name);
			}
		}
		else if (maxCost > 0) {
			var maxNames = consumeMax(maxCost);
			for (var j = 0; j < array_length(maxNames); j++) {
				name += maxNames[j] + " & "; 
			}
			name = string_delete(name, string_length(name) - 2, 2);
			name = string_trim(name);
		}
		
		var newItem = spawnNewDisplay(displaySprite, yX, yC, name);
		newItem.defaultY = defaultY + sprite_get_height(displaySprite) * displayCurrYIndex;
		newItem.tiedObj = self;
		
		array_push(displayObjects, newItem);
		
		if (itemName == "Max") {
			array_push(global.maxList, newItem);
		}
		
		if (yC + sprite_get_height(displaySprite) > self.y + sprite_height - 64) {
			displayCurrYIndex = 0;
			displayCurrXIndex++;
		}
		else
			displayCurrYIndex++;
		
	}
	
	while (unlockedUpgrades < array_length(upgrades) - 1 &&
		itemCount >= upgrades[unlockedUpgrades + 1].requirementCount) {
		unlockedUpgrades++;
	}
	
	
	cost = calculateCost(itemCount, growthFactor, 1, baseCost, baseCostDigit, growthFactorConstant, growthFactorConstantDigit);
	cost10 = calculateCost(itemCount, growthFactor, 10, baseCost, baseCostDigit + 1, growthFactorConstant, growthFactorConstantDigit);
	cost100 = calculateCost(itemCount, growthFactor, 100, baseCost, baseCostDigit + 2, growthFactorConstant, growthFactorConstantDigit);
	drainPerTick = convertToDigit(waterDrainRate * itemCount * drainRateModifiers / 60);
	drainPerTick[1] += waterDrainRateDigit;
}