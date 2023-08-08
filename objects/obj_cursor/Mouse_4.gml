
if (!global.useCursor) {
	cursor_sprite = oldCursorSprite;
	window_set_cursor(cr_none);
}
else {
	oldCursorSprite = cursor_sprite;
	window_set_cursor(cr_default);
	cursor_sprite = cursorSprite;
}

global.useCursor = !global.useCursor;