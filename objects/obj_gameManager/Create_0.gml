/// @description Insert description here
// You can write your code in this editor

#macro digit3 "K"
#macro digit6 "M"
#macro digit9 "B"
#macro digit12 "T"
#macro digit15 "Qd"
#macro digit18 "Qt"
#macro digit21 "Sx"
#macro digit24 "Sp"

// 1335 * 10^21  L in ocean
// 
// int-64 Max size ~ 9.2 * 10 ^ 18
// 5 missing digits that are needed to check for.
global.waterInOcean = 1.335;
global.waterInOceanDigit = 24;
// bottom 17 digits
// Since cut off is ~9.2 *10^18 need to cut off at 17th digit
global.drainedWater = 0;
global.drainedWaterDigit = 0;
global.initialClickDrainRate = 1;
global.initialClickDrainRateDigit = 0;

global.maxItem = pointer_null;
global.shopSprites = {};
global.displaySprites = {};
global.upgradeSprites = {};
global.gameTime = 0;

global.pause = false;

global.usedMax = [];

global.genericMax = [];
global.max = {};