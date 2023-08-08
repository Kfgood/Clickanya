/// @description Insert description here
// You can write your code in this editor

draw_sprite_ext(spr_victory, 0, x - sprite_get_width(spr_victory) / 2, y, 1, 1, 0, c_aqua, 1);

draw_sprite_ext(spr_victory2, 0, x - sprite_get_width(spr_victory2) / 2, y + sprite_get_height(spr_victory), 1, 1, 0, c_aqua, 1);

draw_set_font(fnt_Victory);
draw_set_color(c_black);

draw_text(x - credits_w/2, y, credits);
