// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro saveLocation working_directory + "/save/save.json"

function spawnNewDisplay(sprite, xx, yy, name){
	
	return instance_create_depth(xx, yy, 0, obj_displayObj, {sprite : sprite, displayItemName : name})
	
}

function getRandomMaxName() {
	
	var maxi = array_length(global.max.names);
	
	if (maxi == 0) return false;
	
	var rndMax = irandom(maxi);
	
	var r = global.max.names[rndMax];
	array_delete(global.max.names, r, 1);
	
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