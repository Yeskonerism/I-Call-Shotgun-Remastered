if (trigger_repeat) trigger_done = false; // reset for repeat use

// --- Timed trigger ---
if (timed_trigger && !trigger_done) {
    trigger_timer--;
    if (trigger_timer <= 0) {
		if(dialouge_trigger) instance_destroy(obj_dialouge_box);
		
        trigger_function();
        trigger_done = true;
    }
}

// --- Collision trigger ---
if (!timed_trigger && !trigger_done && place_meeting(x, y, target_obj)) {

    // Require key press
	if (end_on_key) {
        if (keyboard_check_pressed(end_on_pressed)) {
			if(dialouge_trigger) instance_destroy(obj_dialouge_box);
			
			trigger_function();
			trigger_done = true;
        }
    } 
    // Trigger immediately on collision
    else {
		if(dialouge_trigger) instance_destroy(obj_dialouge_box);
		
        trigger_function();
        trigger_done = true;
    }
}

// debug
if(obj_user_interface.show_debug_mode == DebugView.WorldValues) image_alpha = 1;
else image_alpha = 0;
