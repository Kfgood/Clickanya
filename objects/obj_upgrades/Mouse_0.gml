if (tiedObj && visible && decreaseWaterDrained(cost[0], cost[1]) >= 0) {
	purchased = true;
	tiedObj.drainRateModifiers += upgradeMul;
	
	var temp = tiedObj.displayObjects;
	
	for (var i = 0; i < array_length(temp); i++) {
		if (variable_instance_exists(self, "mainGraphic")) {
			temp[i].sprite = mainGraphic;
		}
	}
	
}