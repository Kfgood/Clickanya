#macro sbEndingHeight room_height - 32
#macro sbStartingHeight 32
#macro sbEndingWidth room_width
#macro sbStartingWidth room_width - 32

yy = 32;
yScale = 5;

var s = sprite_get_height(spr_scrollBar)*yScale;
yHalfWay = s / 2;

clickY = 0;

pressed = false;