if (!variable_instance_exists(self, "itemName")) {
	itemName = "Max";
	growthFactor = 1.1;
	baseCost = 10;
	baseCostDigit = 0;
	waterDrainRate = 1;
	waterDrainRateDigit = 0;
	growthFactorConstant = 1;
	growthFactorConstantDigit = 0;
	spriteName = "max";
	maxCost = 0;
}

if (!variable_instance_exists(self, "displaySprite")) {
	displaySpriteName = spriteName;
}

if (!variable_instance_exists(self, "additionalSpriteData")) additionalSpriteData = [];

itemCount = 0;
counter = 1;
upgradeTier = 0;
itemTier = 0;

unlocked = 0;
discovered = 0;

drainRateModifiers = 1;
drainPerTick = [0,0];

displayCurrXIndex = 0;
displayCurrYIndex = 0;

displayObjects = [];

sprite = pointer_null;

upgrades = [];
upgradeIndex = 0;
unlockedUpgrades = -1;

defaultY = y;

cost = calculateCost(itemCount, growthFactor, 1, baseCost, baseCostDigit, growthFactorConstant, growthFactorConstantDigit);
cost10 = calculateCost(itemCount, growthFactor, 10, baseCost, baseCostDigit + 1, growthFactorConstant, growthFactorConstantDigit);
cost100 = calculateCost(itemCount, growthFactor, 100, baseCost, baseCostDigit + 2, growthFactorConstant, growthFactorConstantDigit);

if (struct_get(global.shopSprites, spriteName)) {
	sprite = struct_get(global.shopSprites, spriteName);
}
else {
	sprite = sprite_add(working_directory + "/sprites/items/" + spriteName + ".png", 1, false, true, 0, 0);
	struct_set(global.shopSprites, spriteName, sprite);
}

if (struct_get(global.displaySprites, displaySpriteName)) {
	displaySprite = struct_get(global.displaySprites, displaySpriteName);
}
else {
	displaySprite = sprite_add(working_directory + "/sprites/items/display/" + displaySpriteName + ".png", 1, false, true, 0, 0);
	struct_set(global.displaySprites, displaySpriteName, displaySprite);
}

if (!variable_instance_exists(self, "upgradeGraphics")) {
	upgradeGraphics = [];
}

for (var i = 0; i < array_length(upgradeGraphics); i++) {
	//Loading main and segment sprites into software
	if (struct_get(upgradeGraphics[i], "main") != undefined) {
		var t = upgradeGraphics[i].main;
		if (struct_get(global.displaySprites, t)) {
			upgradeGraphics[i].main = struct_get(global.displaySprites, t);
		}
		else {
			upgradeGraphics[i].main = sprite_add(working_directory + "/sprites/items/display/" + t + ".png", 1, false, true, 0, 0);
			struct_set(global.displaySprites, t, upgradeGraphics[i].main);
		}
	}
	else if (struct_get(upgradeGraphics[i], "segment") != undefined) {
		var t = upgradeGraphics[i].segment;
		if (struct_get(global.displaySprites, t)) {
			upgradeGraphics[i].segment = struct_get(global.displaySprites, t);
		}
		else {
			upgradeGraphics[i].segment = sprite_add(working_directory + "/sprites/items/display/" + t + ".png", 1, false, true, 0, 0);
			struct_set(global.displaySprites, t, upgradeGraphics[i].segment);
		}
	}
}