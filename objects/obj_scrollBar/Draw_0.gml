
draw_sprite(spr_up, 0, sbStartingWidth, 0)
draw_sprite(spr_down, 0, sbStartingWidth, sbEndingHeight)
draw_sprite_ext(spr_scrollBarZone, 0, sbStartingWidth, 32, 1, (room_height - 64) / 32, 0, c_white, 1);
draw_sprite_ext(spr_scrollBar, 0, sbStartingWidth, yy, 1, yScale, 0, c_white, 1);