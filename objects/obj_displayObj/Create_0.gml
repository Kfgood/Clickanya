/// @description Insert description here
// You can write your code in this editor

if (!variable_instance_exists(self, "displayItemName")) {
	displayItemName = "Max";
	itemName = "Max";
	spriteName = "max";
}

if (!variable_instance_exists(self, "sprite")) {
	sprite = pointer_null;

	if (!struct_get(global.displaySprites, spriteName)) {
		sprite = struct_get(global.displaySprites, spriteName);
	}
	else {
		sprite = sprite_add(working_directory + "/sprites/items/display/" + spriteName + ".png", 1, true, true, 0, 0);
		struct_set(global.displaySprites, spriteName, sprite);
	}
}