if(is_activated) image_index = 1;
else image_index = 0;

if(keyboard_check_pressed(ord("E")) && distance_to_object(obj_player) <= activation_distance) {
	if(!collision_line(x,y,obj_player.x,obj_player.y,obj_solid,true,true)) {
		if(!is_activated) {
			is_activated = true;
			debug_stream_add("Console successfully activated");
		}
	}
}