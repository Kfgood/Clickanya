/// @description Insert description here
// You can write your code in this editor

//Load JSONs of shop items

var path = working_directory + "/upgradeItems";

var upgrades = loadJSONResource(path);

var l = layer_create(-1, "roomStartInstances");

if (is_array(upgrades)) {
	for (var i = 0; i < array_length(upgrades); i++) {
		var fileId = file_text_open_read(path + "/" + upgrades[i]);
		var fileData = "";
		while (!file_text_eof(fileId))
			fileData += file_text_readln(fileId);
		file_text_close(fileId);
		
		upgrades[i] = json_parse(fileData);
	}
}

array_sort(upgrades, function(o1, o2) {
	return o1.upgradeMul - o2.upgradeMul;
});

for (var i = 0; i < array_length(upgrades); i++) {
		global.clickRateUpgrades[i] = instance_create_depth(room_width/6 - array_length(upgrades)*32/2 + 32*i, 0, 0, obj_upgrades, upgrades[i]);
		global.clickRateUpgrades[i].forClicks = true;
		global.clickRateUpgrades[i].cost = [1, (i + 1)*4];
		global.clickRateUpgrades[i].visible = false;
		global.clickRateUpgrades[i].tier = i;
		
		global.cursorSprites[i] = sprite_add(working_directory + "/sprites/upgrades/cursor/" + global.clickRateUpgrades[i].spriteName + ".png", 0, false, false, 0, 0);
		
}

path = working_directory + "/shopItems";

var items = loadJSONResource(path);

if (is_array(items)) {
//if (directory_exists(path)) {
//	var jsonFiles = [];
//	var fileName = file_find_first(path + "/*.json", fa_none);
	
//	while (fileName != "") {
//		array_push(jsonFiles, fileName);
//		fileName = file_find_next();
//	}
	
//	file_find_close();
	
	var posX = room_width - 320 - 32;
	var posY = 32;
	for (var i = 0; i < array_length(items); i++) {
		var fileId = file_text_open_read(path + "/" + items[i]);
		var fileData = "";
		while (!file_text_eof(fileId))
			fileData += file_text_readln(fileId);
		file_text_close(fileId);
		
		try {
			var temp = instance_create_depth(posX, 0, 0, obj_shopItem, json_parse(fileData))
			if (temp.itemName == "Max") {
				global.maxItem = temp;
			}
			items[i] = temp;
			
		}
		catch (e) {
			show_debug_message("Error with spawning JSON defined instance {0}: {1}", fileData, e);
		}
	}
	
	array_sort(items, function(o1, o2) {
		return digitNumberComparison(o1.waterDrainRate, o1.waterDrainRateDigit,
			o2.waterDrainRate, o2.waterDrainRateDigit);
	});
	
	global.finalTier = items[array_length(items) - 1];
	
	items[0].unlocked = true;
	for (var i = 0; i < array_length(items); i++) {
		items[i].y = posY;
		items[i].defaultY = posY;
		items[i].itemTier = i;
		items[i].visible = false;
		
		for (var k = 0; k < array_length(upgrades); k++) {
			upgrades[k].tiedObj = items[i];
			var upgrade = instance_create_depth(posX + 32*k + string_width("Upgrades: "), posY - 32, -1, obj_upgrades, upgrades[k]);
			array_push(items[i].upgrades, upgrade);
			upgrade.visible = false;
			if (variable_instance_exists(items[i], "upgradeRequirement")) {
				upgrade.requirementCount = items[i].upgradeRequirement[k]
			}
			if (variable_instance_exists(items[i], "upgradeCost")) {
				upgrade.cost = string_split(items[i].upgradeCost[k], "E");
				upgrade.cost[0] = real(upgrade.cost[0]);
				upgrade.cost[1] = real(upgrade.cost[1]);
			}
		}
		posY += items[i].sprite_height + 32
	}
	items[1].visible = true;
	items[0].visible = true;
}

global.items = items;

path = working_directory + "/maxNames.json";
var fileId = file_text_open_read(path);

if (!fileId) return;

var fileData = "";
while (!file_text_eof(fileId))
	fileData += file_text_readln(fileId);
file_text_close(fileId);

global.max = json_parse(fileData);

if (global.load)
	load();