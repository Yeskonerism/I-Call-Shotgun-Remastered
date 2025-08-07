// Fading in (fade to black)
if (fading_in) {
	fade_alpha += fade_speed;
	if (fade_alpha >= 1) {
		fade_alpha = 1;
		fading_in = false;

		// Delay and then fade out
		if (target_room != noone) {
			room_goto(target_room); // Transition here
			
			timer = hold_frame;
			fading_out = true;
		}
	}
}

// Fading out (black to visible)
else if (fading_out) {
	if (timer > 0) {
		timer--;
	} else {
		fade_alpha -= fade_speed;
		if (fade_alpha <= 0) {
			fade_alpha = 0;
			instance_destroy(); // Done fading
		}
	}
}
