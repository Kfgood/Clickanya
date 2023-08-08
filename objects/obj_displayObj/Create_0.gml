/// @description Insert description here
// You can write your code in this editor

if (!variable_instance_exists(self, "displayItemName")) {
	displayItemName = "Max";
	itemName = "Max";
	spriteName = "max";
}

defaultY = 0;

if (!variable_instance_exists(self, "sprite")) {
	sprite = pointer_null;

	if (!struct_get(global.displaySprites, spriteName)) {
		sprite = struct_get(global.displaySprites, spriteName);
	}
	else {
		sprite = sprite_add(working_directory + "/sprites/items/display/" + spriteName + ".png", 1, false, true, 0, 0);
		struct_set(global.displaySprites, spriteName, sprite);
	}
}

if (!variable_instance_exists(self, "additionalSpriteData")) {
	additionalSpriteData = [];
}

if (!variable_instance_exists(self, "upgradeGraphics")) {
	upgradeGraphics = [];
}

if (!variable_instance_exists(self, "tiedObj")) {
	tiedObj = pointer_null;
}