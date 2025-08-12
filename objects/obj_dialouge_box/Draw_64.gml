if(font != undefined) {
	draw_set_font(font);	
	
	// Word-wrap the text
	var wrapped_text = string_wrap(text, wrap_width);
	var text_w = string_width(wrapped_text);
	var text_h = string_height(wrapped_text);

	// Box size based on text size + padding
	var box_w = text_w + (padding_x);
	var box_h = text_h + (padding_y);

	// Position near bottom-center of screen
	var box_x = display_get_gui_width() / 2;
	var box_y = display_get_gui_height() - (box_h);

	// Draw background box
	draw_gui_box_midpoint_round(box_x, box_y, box_w, box_h, c_black, 0.5);

	// Draw text
	draw_gui_label_ext(box_x,box_y,wrapped_text,c_white,1,font,fa_center,fa_middle);

	reset_all_draw_values();
}