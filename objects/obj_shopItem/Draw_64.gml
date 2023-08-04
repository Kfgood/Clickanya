var cost = calculateCost(itemCount, growthFactor, 1, baseCost, baseCostDigit, growthFactorConstant, growthFactorConstantDigit);

var cost10 = calculateCost(itemCount, growthFactor, 10, baseCost, baseCostDigit + 1, growthFactorConstant, growthFactorConstantDigit);

draw_text(self.x + self.sprite_width / 3, self.y,
	string("Name: {0}\nCount: {1}\nDrain Rate: {2}e{3}\nCost: {4}e{5}\nCost10: {6}e{7}",
	itemName, itemCount, waterDrainRate * drainRateModifiers * itemCount, waterDrainRateDigit,
	cost[0],
	cost[1],
	cost10[0],
	cost10[1]))

