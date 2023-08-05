/// @description Insert description here
// You can write your code in this editor

/*
	If the add rate is < 1 it needs to be handled differently because the total value is a 64-bit int
	and not a double floating point number
	(precision becomes an issue at high values - 352*10^15 + 1 doesn't exist in double)
*/
if (itemCount <= 0)
	return;
	

counter++;
var temp = convertToDigit(waterDrainRate * itemCount * counter * drainRateModifiers / 60);
var result = increaseWaterDrained(temp[0], temp[1] + waterDrainRateDigit);
if (is_array(result)) {
	show_debug_message("Lost water from large addition: {0}e{1}", result[0], result[1]);
}
else if (result == -1) {
	// Adding too small of a value to count
	counter++;
}
else if (result == 0) {
	//addition successful
	counter = 0;
}