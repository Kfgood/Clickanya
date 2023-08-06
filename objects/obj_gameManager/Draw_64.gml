/// @description Handle draw for UI

var drainedWater = string("{0}e{1} / {2}e{3}",
	(global.drainedWaterDigit < 3 ?
		global.drainedWater*power(10, global.drainedWaterDigit) : global.drainedWater * 1000), 
	(global.drainedWaterDigit < 3 ? 0 : global.drainedWaterDigit - 3), 
	global.waterInOcean, global.waterInOceanDigit);

draw_text(room_width / 6, string_height(drainedWater), drainedWater)

//draw_rectangle_color(room_width - 32, 0, room_width, room_height, c_dkgrey, c_dkgrey, c_dkgrey, c_dkgrey, false);
//draw_rectangle_color(room_width - 28, 0, room_width - 4,  room_height*100 / (global.finalTier.y + global.finalTier.sprite_height), c_grey, c_grey, c_grey, c_grey, false)