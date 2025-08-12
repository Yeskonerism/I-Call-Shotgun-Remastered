if(!opened) { image_index = 0; solid = 1; }
else { image_index = 1; solid = 0; }

if(console_activated) {
	if(console_obj != noone) {
		if(console_obj.is_activated) opened = true;
		else opened = false;
	}
}