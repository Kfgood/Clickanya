// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function spawnNewDisplay(sprite, xx, yy, name){
	
	return instance_create_depth(xx, yy, 0, obj_displayObj, {sprite : sprite, displayItemName : name})
	
}

function getRandomMaxName() {
	//Testing push mechanics
	return "Mex";
}