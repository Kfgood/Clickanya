
global.gameTime++;

if (global.clickRateUpgrades[4].visible) return;
for (var i = 0; i < array_length(global.clickRateUpgrades); i++) {
	if (i==0 && !global.clickRateUpgrades[i].visible 
		||
		i > 0 && global.clickRateUpgrades[i - 1].purchased && !global.clickRateUpgrades[i].visible) {
		if (waterDrainedComparison(global.clickRateUpgrades[i].cost[0], global.clickRateUpgrades[i].cost[1]) >= 0) {
			global.clickRateUpgrades[i].visible = true;
			return;
		}
	}
}
