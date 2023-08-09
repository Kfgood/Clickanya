// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro saveLocation working_directory + "saves/save.json"

function spawnNewDisplay(sprite, xx, yy, name){
	if (!is_string(name)) name = "";
	
	return instance_create_depth(xx, yy, 0, obj_displayObj, {sprite : sprite, displayItemName : name})
	
}

function getRandomMaxName() {
	
	var maxi = array_length(global.max.names);
	
	if (maxi == 0) return false;
	
	var rndMax = irandom(maxi - 1);
	
	var r = global.max.names[rndMax];
	array_delete(global.max.names, rndMax, 1);
	
	return r.name;
}

function save() {
	var saveFile = file_text_open_write(saveLocation);
	
	if (!saveFile) {
		throw "Unable to create save file";
	}
	
	var data = {shopItem : {}, displayObj : {}, upgrades : {}, global : {}};
	var temp;
	
	with (obj_shopItem) {
		temp = data.shopItem;
		struct_set(temp, itemName, {});
		temp = struct_get(temp, itemName);
		temp.itemCount = itemCount;
		temp.upgradeTier = upgradeTier;
		temp.itemTier = itemTier;
		
		temp.unlocked = unlocked;
		temp.discovered = discovered;
		
		temp.drainRateModifiers = drainRateModifiers;
		temp.drainPerTick = drainPerTick;
		
		temp.displayCurrYIndex = displayCurrYIndex;
		temp.displayCurrXIndex = displayCurrXIndex;
		
		temp.upgradeIndex = upgradeIndex;
		temp.unlockedUpgrades = unlockedUpgrades;
		
		temp.cost = cost;
		temp.cost10 = cost10;
		temp.cost100 = cost100;
		temp.visible = visible;
	}
	
	with (obj_displayObj) {
		temp = data.displayObj;
		if (!struct_exists(temp, tiedObj.itemName))
			struct_set(temp, tiedObj.itemName, []);
		temp = struct_get(temp, tiedObj.itemName);
		array_push(temp, {x : x, y : defaultY, displayItemName : displayItemName});
	}
	
	var cursorSpriteObj;
	
	with (obj_upgrades) {
		temp = data.upgrades;
		
		if (!forClicks) {
			if (!struct_exists(temp, tiedObj.itemName))
				struct_set(temp, tiedObj.itemName, {});
			temp = struct_get(temp, tiedObj.itemName);
		}
		else {
			if (!struct_exists(temp, "click"))
				struct_set(temp, "click", {});
			temp = struct_get(temp, "click");
			
			cursorSpriteObj = pointer_null;
			
			for (var i = 0; i < 5; i++) {
				if (global.clickRateUpgrades[i].purchased)
					cursorSpriteObj = i;
			}
		}
		
		struct_set(temp, upgradeName, {});
		temp = struct_get(temp, upgradeName);
		
		temp.purchased = purchased;
		temp.forClicks = forClicks;
		temp.tier = tier;
		temp.cost = cost;
		temp.visible = visible;
	}
	
	temp = data.global;
	
	temp.drainedWater = global.drainedWater;
	temp.drainedWaterDigit = global.drainedWaterDigit;
	temp.clickRateMul = global.clickRateMul;
	temp.gameTime = global.gameTime;
	temp.usedMax = global.usedMax;
	temp.max = global.max;
	
	data.clickable = {};
	data.clickable.clicked = obj_clickZone.clicked;
	
	data.mouse = cursorSpriteObj;
	
	file_text_write_string(saveFile, json_stringify(data, true));
	
	file_text_close(saveFile);
	
}

function load() {
	var saveFile = file_text_open_read(saveLocation);
	
	if (!saveFile) {
		throw "Unable to load save file";
	}
	
	var data = {};
	
	try {
		var fileData = "";
		while (!file_text_eof(saveFile))
			fileData += file_text_readln(saveFile);
		file_text_close(saveFile);
		
		data = json_parse(fileData);
	}
	catch (e) {
		throw "Unable to read save file";
	}
	var temp;
	
	with (obj_shopItem) {
		temp = data.shopItem;
		if (!struct_exists(temp, itemName)) continue;
		temp = struct_get(temp, itemName);
		
		itemCount = temp.itemCount;
		upgradeTier = temp.upgradeTier;
		itemTier = temp.itemTier;
		
		unlocked = temp.unlocked;
		discovered = temp.discovered;
		
		drainRateModifiers = temp.drainRateModifiers;
		drainPerTick = temp.drainPerTick;
		
		displayCurrYIndex = temp.displayCurrYIndex;
		displayCurrXIndex = temp.displayCurrXIndex;
		
		upgradeIndex = temp.upgradeIndex;
		unlockedUpgrades = temp.unlockedUpgrades;
		
		cost = temp.cost;
		cost10 = temp.cost10;
		cost100 = temp.cost100;
		
		visible = temp.visible;
		
		temp = data.displayObj;
		if (!struct_exists(temp, itemName)) continue;
		
		temp = struct_get(temp, itemName);
		
		if (!is_array(temp)) continue;
		
		for (var i = 0; i < array_length(temp); i++) {
			
			var newItem = spawnNewDisplay(displaySprite, temp[i].x, temp[i].y, temp[i].displayItemName);
			newItem.tiedObj = self;
			newItem.defaultY = temp[i].y;
			array_push(displayObjects, newItem);
		
			if (itemName == "Max") {
				array_push(global.maxList, newItem);
			}
		}
		
	}
	
	with (obj_upgrades) {
		temp = data.upgrades;
		
		if (!forClicks) {
			temp = struct_get(temp, tiedObj.itemName);
		}
		else {
			temp = struct_get(temp, "click");
		}
		
		temp = struct_get(temp, upgradeName);
		
		purchased = temp.purchased;
		forClicks = temp.forClicks;
		tier = temp.tier;
		cost = temp.cost;
		visible = temp.visible;
	}
	
	temp = data.global;
	
	global.drainedWater = temp.drainedWater;
	global.drainedWaterDigit = temp.drainedWaterDigit;
	global.clickRateMul = temp.clickRateMul;
	global.gameTime = temp.gameTime;
	global.usedMax = temp.usedMax;
	global.max = temp.max;
	
	obj_clickZone.clicked = data.clickable.clicked;
	obj_cursor.oldCursorSprite = global.cursorSprites[data.mouse];
	obj_cursor.cursorSprite = cursor_sprite;
	cursor_sprite = global.cursorSprites[data.mouse];
	window_set_cursor(cr_none);
	
}

function consumeMax(maxCount, genericOnly = false) {
	
	if (global.maxItem.itemCount < maxCount) return false;
	
	var r = [];
	var arrInd;
	
	for (var i = 0; i < maxCount; i++) {
		var temp = array_pop(global.maxList);
		
		if (temp.displayItemName != "") {
			array_push(r, temp.displayItemName);
		}
		
		instance_destroy(temp);
		
		if (global.maxItem.displayCurrYIndex <= 0) {
			global.maxItem.displayCurrXIndex--;
			global.maxItem.displayCurrYIndex = 3;
		}
		else {
			global.maxItem.displayCurrYIndex--;
		}
		
	}
	
	global.maxItem.itemCount -= maxCount;
	
	with (global.maxItem) {
		cost = calculateCost(itemCount, growthFactor, 1, baseCost, baseCostDigit, growthFactorConstant, growthFactorConstantDigit);
		cost10 = calculateCost(itemCount, growthFactor, 10, baseCost, baseCostDigit + 1, growthFactorConstant, growthFactorConstantDigit);
		cost100 = calculateCost(itemCount, growthFactor, 100, baseCost, baseCostDigit + 2, growthFactorConstant, growthFactorConstantDigit);
	}
	return r;
}

function digitToExpanded(num, digit) {
	if (num == 0) return "0";
	
	var drainedWater = string("{0}{1}",
	(digit < 3 ? num*power(10, digit) : num * power(10, digit % 3)), 
	(digit < 3 ? "" : string("{0}", getDigitNameChar(digit - (digit % 3)))));
	
	return drainedWater;
	//return string("{0} x 10^{1}", num, digit);
}

function getDigitNameChar(digit) {
	var r = ""
	var num = floor(digit/3);
	switch (num) {
		case 0:
			r = "";
			break;
		case 1:
			r = digit3;
			break;
		case 2:
			r = digit6;
			break;
		case 3:
			r = digit9;
			break;
		case 4:
			r = digit12;
			break;
		case 5:
			r = digit15;
			break;
		case 6:
			r = digit18;
			break;
		case 7:
			r = digit21;
			break;
		case 8:
			r = digit24;
			break;
		default:
			r = string("*10^{0}", digit);
	}
	
	return r;
}