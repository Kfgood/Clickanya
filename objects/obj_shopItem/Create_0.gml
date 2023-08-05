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

itemCount = 0;
counter = 1;

drainRateModifiers = 1;

displayCurrXIndex = 1;
displayCurrYIndex = 1;

displayObjects = [];

sprite = pointer_null;

upgrades = [];
upgradeIndex = 0;

if (struct_get(global.shopSprites, spriteName)) {
	sprite = struct_get(global.shopSprites, spriteName);
}
else {
	sprite = sprite_add(working_directory + "/sprites/items/" + spriteName + ".png", 1, true, true, 0, 0);
	struct_set(global.shopSprites, spriteName, sprite);
}

if (struct_get(global.displaySprites, displaySpriteName)) {
	displaySprite = struct_get(global.displaySprites, displaySpriteName);
}
else {
	displaySprite = sprite_add(working_directory + "/sprites/items/display/" + displaySpriteName + ".png", 1, true, true, 0, 0);
	struct_set(global.displaySprites, displaySpriteName, displaySprite);
}