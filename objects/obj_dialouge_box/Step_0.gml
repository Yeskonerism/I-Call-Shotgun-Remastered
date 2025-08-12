// Timer close
if (auto_close) {
    timer--;
    if (timer <= 0) instance_destroy();
}

// Key close
if (close_on_key && keyboard_check_pressed(close_key)) {
    instance_destroy();
}
