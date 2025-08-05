function debug_stream_initialise(){
	global.debug_stream_lines = [];
	global.debug_scroll_offset = 0;
	global.debug_max_lines_visible = 15; // Set based on available height
	
	global.debug_stream_line_number = 1;
}

function debug_stream_add(_string) {
	var lines = string_split(string(global.debug_stream_line_number) + " - " + _string, "\n");
	for (var i = 0; i < array_length(lines); i++) {
		array_push(global.debug_stream_lines, lines[i]);
	}
	
	global.debug_stream_line_number++;
}
