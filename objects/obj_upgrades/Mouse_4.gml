if (tiedObj && !purchased && visible && decreaseWaterDrained(cost[0], cost[1]) >= 0) {
	purchased = true;
	tiedObj.drainRateModifiers += upgradeMul;
	tiedObj.upgrade = self;
	
	tiedObj.upgradeTier++;
	show_debug_message(tiedObj.upgradeTier);
}