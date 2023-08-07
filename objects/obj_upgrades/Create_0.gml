if (!variable_instance_exists(self, "upgradeName")) {
	upgradeName = "Straw";
	upgradeMul = 1.25;
	spriteName = "straw";
	requirementCount = 10;
}

if (!variable_instance_exists(self, "tiedObj")) {
	tiedObj = pointer_null;
	cost = [0, 0];
}
else if (!variable_instance_exists(self, "cost"))
	cost = calculateCost(floor(requirementCount*1.5), tiedObj.growthFactor, 1,
				tiedObj.baseCost, tiedObj.baseCostDigit,
				tiedObj.growthFactorConstant, tiedObj.growthFactorConstantDigit);

if (struct_get(global.upgradeSprites, spriteName)) {
	sprite = struct_get(global.upgradeSprites, spriteName);
}
else {
	sprite = sprite_add(working_directory + "/sprites/upgrades/" + spriteName + ".png", 1, false, true, 0, 0);
	struct_set(global.upgradeSprites, spriteName, sprite);
}

purchased = false;