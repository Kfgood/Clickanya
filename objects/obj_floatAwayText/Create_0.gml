/// @description Insert description here
// You can write your code in this editor

if (!variable_instance_exists(self, "clickPoints"))
	clickPoints = [0, 0];
life = random_range(0.5, 1)*60;
alarm_set(0, life);

speed = 0.5;
direction = irandom(360);
