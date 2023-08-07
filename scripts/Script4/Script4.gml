// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro saveLocation working_directory + "/save/save.json"

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
	
	
	
}

function load() {
	var saveFile = file_text_open_read(saveLocation);
	
	if (!saveFile) {
		throw "Unable to load save file";
	}
	
	
	
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
			r = string("*10^{0}", num);
	}
	
	return r;
}