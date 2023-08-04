if (global.drainedWater >= 10 || (global.drainedWater < 1 && global.drainedWater > 0 && global.drainedWaterDigit > 0)) {
	
	show_debug_message("Starting Conversion {0}e{1}", global.drainedWater, global.drainedWaterDigit);
	var t = log10(global.drainedWater);
	t = floor(t < 0 ? t - 1 : t);
	global.drainedWater /= power(10, t);
	global.drainedWaterDigit += t;
	show_debug_message("Drained Converted {0}e{1}", global.drainedWater, global.drainedWaterDigit);
}

//For game victory only need to check the top 5 digits and that the last digit is more than 1
if (global.drainedWaterDigit >= global.waterInOceanDigit && global.drainedWater > 0) {
	//Victory stuff
	show_debug_message("Game Victory!");
}