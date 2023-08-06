if (sprite > 0) {
	var aLayer = [];
	
	if (tiedObj.upgradeTier == 0) {
		//Sprites that go under the main sprite
		for (var i = 0; i < array_length(tiedObj.additionalSpriteData); i++) {
			var sp = struct_get(global.displaySprites, tiedObj.additionalSpriteData[i].name);
			if (tiedObj.additionalSpriteData[i].layer >= 0)
				array_push(aLayer, tiedObj.additionalSpriteData[i]);
			else
				draw_sprite(sp, 0, self.x + tiedObj.additionalSpriteData[i].pos[0], self.y + tiedObj.additionalSpriteData[i].pos[1])
		}
	}
	else if (struct_get(tiedObj.upgradeGraphics[tiedObj.upgradeTier - 1], "segment") != undefined) {
		//Sprites that go under the main sprite
		var graphic = tiedObj.upgradeGraphics[tiedObj.upgradeTier - 1];
		var sp = graphic.segment;
		for (var j = 0; j < array_length(graphic.segmentPositions); j++) {
			if (graphic.segmentLayer[j] >= 0)
				array_push(aLayer, graphic);
			else
				draw_sprite_ext(sp, 0, self.x + graphic.segmentPositions[j][0],
					self.y + graphic.segmentPositions[j][1], graphic.segmentFlip[j] < 0 ? -1 : 1,
					1, graphic.segmentRotation[j], c_white, 1);
		}
	}
	
	if (tiedObj.upgradeTier > 0 && array_length(tiedObj.upgradeGraphics) > tiedObj.upgradeTier - 1 &&
		struct_get(tiedObj.upgradeGraphics[tiedObj.upgradeTier - 1], "main") != undefined)
		draw_sprite(tiedObj.upgradeGraphics[tiedObj.upgradeTier - 1].main, 0, self.x, self.y);
	else
		draw_sprite(sprite, 0, self.x, self.y);
	
	//if (tiedObj.upgradeTier == 0) {
		//Sprites that go over the main sprite
		for (var i = 0; i < array_length(aLayer); i++)
			draw_sprite(struct_get(global.displaySprites, aLayer[i].name), 0,
				self.x + aLayer[i].pos[0], self.y + aLayer[i].pos[1]);
	//}
	//else {
	//	//Sprites that go under the main sprite
	//	for (var i = 0; i < array_length(tiedObj.additionalSpriteData); i++) {
	//		var sp = struct_get(global.displaySprites, tiedObj.additionalSpriteData[i].name);
	//		if (tiedObj.additionalSpriteData[i].layer >= 0)
	//			array_push(aLayer, tiedObj.additionalSpriteData[i]);
	//		else
	//			draw_sprite(sp, 0, self.x + tiedObj.additionalSpriteData[i].pos[0], self.y + tiedObj.additionalSpriteData[i].pos[1])
	//	}
	//}
}
else
	draw_self();
