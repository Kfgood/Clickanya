if (!variable_instance_exists(self, "upgradeName")) {
	upgradeName = "Straw";
	upgradeMul = 1.25;
	spriteName = "straw";
	availableAtCount = 10;
}

if (!variable_instance_exists(self, "tiedObj")) {
	tiedObj = pointer_null;
}

if (struct_get(global.upgradeSprites, spriteName)) {
	sprite = struct_get(global.upgradeSprites, spriteName);
}
else {
	sprite = sprite_add(working_directory + "/sprites/upgrades/" + spriteName + ".png", 1, true, true, 0, 0);
	struct_set(global.upgradeSprites, spriteName, sprite);
}

purchased = false;