function menu_create(_elements, _executions) {
	var len = array_length(_elements);
	
	return {
		menu_elements: _elements,
		menu_executions: _executions,
		menu_length: len,
		menu_cursor: 0,
		menu_top_bound: len - 1,
		menu_bottom_bound: 0,
		
		update: function(_key_up, _key_down, _key_enter) {
			if (_key_up) {
				menu_cursor--;
				if (menu_cursor < menu_bottom_bound) menu_cursor = menu_top_bound;
			}

			if (_key_down) {
				menu_cursor++;
				if (menu_cursor > menu_top_bound) menu_cursor = menu_bottom_bound;
			}

			if (_key_enter && array_length(menu_executions) > menu_cursor) {
				var exec = menu_executions[menu_cursor];
				if (is_callable(exec)) {
					exec();
				} else {
					show_debug_message("Execution at index " + string(menu_cursor) + " is not callable.");
				}
			}
		},

		/// @method draw
		/// @param x
		/// @param y
		/// @param seperator
		/// @param font
		/// @param halign
		/// @param valign
		/// @param base color
		/// @param select color
		draw: function(_x, _y, _sep, _font, _halign, _valign, _base_col, _select_col) {
			for (var i = 0; i < menu_length; i++) {
				var txt = menu_elements[i];
				
				draw_set_font(_font);
				draw_set_halign(_halign);
				draw_set_valign(_valign);
					if (i == menu_cursor) {
						draw_text_color(_x, _y + ((font_get_size(_font) + _sep) * i), "> " + txt + " <", _select_col, _select_col, _select_col, _select_col, 1);
					} else {
						draw_text_color(_x, _y + ((font_get_size(_font) + _sep) * i), txt, _base_col, _base_col, _base_col, _base_col, 1);
					}
				reset_all_draw_values();
			}
		}
	};
}
