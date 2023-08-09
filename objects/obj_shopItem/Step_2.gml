/// @description Insert description here
// You can write your code in this editor

for (var i = 0; unlockedUpgrades < array_length(upgrades) && i <= unlockedUpgrades; i++) {
	if (i == 0) upgrades[i].visible = true;
	else if (upgrades[i - 1].purchased == true) upgrades[i].visible = true;
}