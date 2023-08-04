
if (global.gameTime * 60 > timeDelay) {
	
	if (firstDelay && alwaysOnFirstDelay) {
		//Starts event
		eventActive = true;
	}
	else if (random(1) > chanceEachDelay){
		//Starts event
		eventActive = true;
	}
	
}
