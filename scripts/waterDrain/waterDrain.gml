// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function decreaseWaterDrained(amount, amountDigit){
	
	var temp = convertToDigit(amount);
	amount = temp[0];
	amountDigit += temp[1];
	
	var diffDigit = global.drainedWaterDigit - amountDigit;
	if (diffDigit > 8) {
		//Too small to be calculated due to bit limitations
		return 1;
	}
	else if (digitNumberComparison(global.drainedWater, global.drainedWaterDigit, amount, amountDigit) < 0)
		//Returns false b/c if diffDigit < -3: amount E amountDigit > drainedWater E drainedWaterDigit
		//Too big
		return -1;
	
	temp = subDigitNumber(global.drainedWater, global.drainedWaterDigit, amount, amountDigit);
	global.drainedWater = temp[0];
	global.drainedWaterDigit = temp[1];
	
	return 0;
}

function increaseWaterDrained(amount, amountDigit) {
	
	var temp = convertToDigit(amount);
	amount = temp[0];
	amountDigit += temp[1];
	
	temp = addDigitNumber(global.drainedWater, global.drainedWaterDigit, amount, amountDigit);
	global.drainedWater = temp[0];
	global.drainedWaterDigit = temp[1];
	
	var diffDigit = global.drainedWaterDigit - amountDigit;
	if (diffDigit > 8) {
		//Too small to count, needs counter to continue to increase
		//show_debug_message("{0}e{1} too small to currently add", amount, amountDigit)
		return -1;
	}
	/*
	else if (diffDigit > 0) {
		//Added as a decimal
		global.drainedWater += amount / (power(10, diffDigit)) //amount E-diffDigit	Right shifting base10 digits 1 or 2 spaces
		//show_debug_message("{0} added", amount / (power(10, diffDigit)))
	}
	//Checks if there is more drainedWater than amount and if the difference in digits is < 3 digit places
	else if (diffDigit > -3) {
		//Large enough to be added plainly
		global.drainedWater += amount;
		global.drainedWaterDigit = amountDigit;
	}
	else {
		var t = global.drainedWater;
		var tDigit = global.drainedWaterDigit;
		global.drainedWater = amount;
		global.drainedWaterDigit = amountDigit;
		
		//returning the "loss" amount of water drained
		return {t, tDigit};
	}
	*/
	return 0;
}

function waterDrainedComparison(amount, amountDigit) {
	
	return digitNumberComparison(global.drainedWater, global.drainedWaterDigit, amount, amountDigit);
	
	//var temp = convertToDigit(amount*counter);
	//amount = temp[0];
	//amountDigit += temp[1];
	
	//var diffDigit = global.drainedWaterDigit - amountDigit;
	//if (diffDigit == 0) {
	//	return global.drainedWater - amount;
	//}
	//else if (diffDigit > 0) {
	//	return 1;
	//}
	//else
	//	return -1;
}

//function calculateCostForIndex(growthFactor, index = 1) {
	
//	var temp;
	
//	var cost = 1;
//	var digit = 0;
//	var costR;
	
//	for (var i = 0; i < index; i++) {
//		cost *= growthFactor;
//		temp = convertToDigit(cost);
//		cost = temp[0];
//		digit += temp[1];
//	}
	
//	return [cost, digit];
	
//}

/***
* Goal here is to reduce cost calculation to just calculate the needed one
*/
function calculateCostGrowthFromCurrentIndex(index, growthFactor) {
	
	//cost = current * growthFactor ^ count
	
	var temp;
	temp = powerDigitNumber(growthFactor, 0, index + count);
	var digit = temp[1];
	var cost = temp[0];
	
	return [cost, digit];
	
}

// currentCost is a stored (growthFactor ^ itemCount) to reduce time at the expense of memory - Should rename to currGrowthFactor
function calculateCost(index, growthFactor, counts = 1, baseCost = 0, baseCostDigit = 0, growthConstant = 1, growthConstantDigit = 0) {
	
	//cost = sum[i=0, count] (base + growthConstant * growth ^ i)
	//cost = base*i + growthConstant * (growth^1 + growth^2 + ... + growth^i)
	
	var temp;
	var currentCostA = powerDigitNumber(growthFactor, 0, index);
	var sum = 0;
	var sumDigit = 0;
	
	//(growth^1 + growth^2 + ... + growth^counts)
	for (var i = 0; i < counts; i++) {
		temp = powerDigitNumber(growthFactor, 0, index + i);
		currentCostA[0] = temp[0];
		currentCostA[1] = temp[1];
		temp = addDigitNumber(sum, sumDigit, temp[0], temp[1]);
		sum = temp[0];
		sumDigit = temp[1];
	}
	
	currentCostA = [sum, sumDigit];
	
	//* growthConstant
	sum *= growthConstant;
		// 10 ^ sumDigit * 10 ^ growthConstant
	sumDigit += growthConstantDigit;
	
	temp = convertToDigit(sum);
	sum = temp[0];
	sumDigit += temp[1];
	
	temp = convertToDigit(baseCost * counts);
	//+ base*i
	temp = addDigitNumber(sum, sumDigit, temp[0], baseCostDigit + temp[1]);
	
	return [temp[0], temp[1], currentCostA[0], currentCostA[1]];
	
}