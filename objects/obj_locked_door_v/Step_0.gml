if(distance_to_object(obj_player) <= 8) {
	if (keycard_has(obj_player, required_card)) {
	    is_locked = false;
	} else {
	    debug_stream_add("Access Denied");
	}	
}

if(is_locked) image_index = 0;
else { 
	if(!opening) opening = true;
}

if(opening) {
	image_speed = 1;
	
	if(image_index == image_number-1) {
		opening = false;
		image_speed = 0;
	}
}

if(image_index >= 7) 
	solid = false;
	
mask_index = sprite_index;