event_inherited();

if(keyboard_check_pressed(ord("E"))) {
	if(!is_activated) {
		is_activated = true;
		debug_stream_add("Console successfully activated");
	}
}