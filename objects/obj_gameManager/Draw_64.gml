/// @description Handle draw for UI

var drainedWater = string("{0}e{1} / {2}e{3}",
	(global.drainedWaterDigit < 3 ?
		global.drainedWater*power(10, global.drainedWaterDigit) : global.drainedWater * 1000), 
	(global.drainedWaterDigit < 3 ? 0 : global.drainedWaterDigit - 3), 
	global.waterInOcean, global.waterInOceanDigit);

draw_text(room_width / 6, string_height(drainedWater), drainedWater)

draw_rectangle(room_width - 32, 0, room_width, room_height, false)