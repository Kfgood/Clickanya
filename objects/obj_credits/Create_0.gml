/// @description Insert description here
// You can write your code in this editor

speed = 1;
direction = 90;

var fileId = file_text_open_read(working_directory + "gameData/credits.txt");
credits = "";
while (!file_text_eof(fileId))
	credits += file_text_readln(fileId) + "\n";
file_text_close(fileId);

maxLobes = "Max lobes you Tanya!! <3\nSorry for any scuff kitany1Teehee";

default_font = draw_get_font();

draw_set_font(fnt_Victory);

credits_w = string_width(credits);
credits_h = string_height(credits);

maxLobes_w = string_width(maxLobes);
maxLobes_h = string_height(maxLobes);

sprite_heights = sprite_get_height(spr_victory) + sprite_get_height(spr_victory2)*2 + 16;

alphaScale = 1;