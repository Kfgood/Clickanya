
function powerDigitNumber(num, digit, pow) {
	
	if (num >= 10) {
		var temp = convertToDigit(num);
		num = temp[0];
		digit += temp[1];
	}
	
	if (power(num, pow) < num && pow > 1) {
		//Fix overflow error
	}
	else if (abs(power(num, pow)) > num && pow < 1) {
		//overflow unless num is -
	}
	
	var temp = convertToDigit(power(num, pow));
	num = temp[0];
	digit = digit * pow + temp[1];
	
	if (ceil(pow) != floor(pow)) {
		temp = digit - floor(digit);
		digit = floor(digit);
		num *= power(10, digit);
		temp = convertToDigit(num);
		num = temp[0];
		digit += temp[1];
	}
	
	return [num, digit];
	
}

function digitNumberComparison(num1, digit1, num2, digit2) {

	var diffDigit = digit1 - digit2;
	if (diffDigit == 0) {
		return num1 - num2;
	}
	else if (diffDigit > 0) {
		return 1;
	}
	else
		return -1;
	
}

function convertToDigit(amount) {
	if (amount == 0) return [0, 0];

	var amountDigit = floor(logn(10, amount));
	amount /= power(10, amountDigit);
	
	return [amount, amountDigit];
}

function addDigitNumber(num1, digit1, num2, digit2) {
	
	if (num1 >= 10) {
		var temp = convertToDigit(num1);
		num1 = temp[0];
		digit1 += temp[1];
	}
	if (num2 >= 10) {
		var temp = convertToDigit(num2);
		num2 = temp[0];
		digit2 += temp[1];
	}
	
	var diffDigit = digit1 - digit2
	if (diffDigit > 8) {
		//Too small to count, needs counter to continue to increase
		//show_debug_message("{0}e{1} too small to add to {2}e{3}", num2, digit2, num1, digit1);
	}
	else if (diffDigit >= 0) {
		//Added as a decimal
		num1 += num2 / (power(10, diffDigit)) //amount E-diffDigit	Right shifting base10 digits 1 or 2 spaces
		//show_debug_message("{0} added", amount / (power(10, diffDigit)))
	}
	//Checks if there is more drainedWater than amount and if the difference in digits is < 3 digit places
	else if (diffDigit > -7) {
		//Large enough to be added plainly
		return addDigitNumber(num2, digit2, num1, digit1);
		//num1 += num2;
		//digit1 = digit2;
	}
	else {
		//returning the "loss" amount of water drained
		return [num2, digit2, num1, digit1];
	}
	
	var temp = convertToDigit(num1);
	num1 = temp[0];
	digit1 += temp[1];
	
	return [num1, digit1];
}

function subDigitNumber(num1, digit1, num2, digit2) {
	
	if (num1 >= 10) {
		var temp = convertToDigit(num1);
		num1 = temp[0];
		digit1 += temp[1];
	}
	if (num2 >= 10) {
		var temp = convertToDigit(num2);
		num2 = temp[0];
		digit2 += temp[1];
	}
	
	var diffDigit = digit1 - digit2
	if (diffDigit > 8) {
		//Too small to count, needs counter to continue to increase
		//show_debug_message("{0}e{1} too small to meaningfully remove from {2}e{3}", num2, digit2, num1, digit1);
	}
	else if (diffDigit > 0) {
		//Added as a decimal
		num1 -= num2 / (power(10, diffDigit)) //amount E-diffDigit	Right shifting base10 digits 1 or 2 spaces
		//show_debug_message("{0} added", amount / (power(10, diffDigit)))
	}
	//Checks if there is more drainedWater than amount and if the difference in digits is < 3 digit places
	else if (digitNumberComparison(num1, digit1, num2, digit2) >= 0) {
		//Large enough to be added plainly
		num1 -= num2;
	}
	else {
		//returning the "loss" amount of water drained
		return [num1, digit1, num2, digit2];
	}
	
	if (num1 < 1) {
		num1 *= 10;
		digit1 -= 1;
	}
	
	return [num1, digit1];
	
}