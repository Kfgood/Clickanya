/// @description Insert description here
// You can write your code in this editor

speed = 1;
direction = 90;

var fileId = file_text_open_read(working_directory + "credits.txt");
credits = "";
while (!file_text_eof(fileId))
	credits += file_text_readln(fileId) + "\n";
file_text_close(fileId);

credits_w = string_width(credits);
credits_h = string_height(credits);

sprite_heights = sprite_get_height(spr_victory) + sprite_get_height(spr_victory2);