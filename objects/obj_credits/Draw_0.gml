/// @description Insert description here
// You can write your code in this editor

draw_sprite_ext(spr_victory, 0, x - sprite_get_width(spr_victory) / 2, y, 1, 1, 0, c_white, 1);

draw_sprite_ext(spr_victory2, 0, x - sprite_get_width(spr_victory2) / 2, y + sprite_get_height(spr_victory), 1, 1, 0, c_white, 1);

draw_set_font(fnt_Victory);

draw_set_color(c_black);

draw_text(x - credits_w/2 - 3, y + sprite_heights + 3, credits);

draw_set_color(c_white);

draw_text(x - credits_w/2, y + sprite_heights, credits);

draw_text_color(x - maxLobes_w/2, y + sprite_heights + credits_h*2 + maxLobes_h, maxLobes, c_red, c_red, c_red, c_red, alphaScale);
