// Timer close
if (auto_close) {
    timer--;
    if (timer <= 0) instance_destroy();
}

// Key close
if (close_on_key && keyboard_check_pressed(close_key)) {
    instance_destroy();
}

if (close_on_mouse && mouse_check_button_pressed(close_mouse)) {
    instance_destroy();
}

// End when function end_event returns true
if(end_on_event && end_event()) {
	instance_destroy();
}
