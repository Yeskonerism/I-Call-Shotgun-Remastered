if (keyboard_check_pressed(vk_f1)) {
    console_active = !console_active;
    if (console_active) {
        keyboard_string = ""; // Clear input buffer when opening
    }
}

if (console_active) {
    // Capture new keyboard input
    if (console_input != keyboard_string) {
        console_input = keyboard_string;
    }

    // Handle Enter
    if (keyboard_check_pressed(vk_enter)) {
        var command = console_input;
        array_push(console_output, "> " + command);
        console_parse_command(command);
        keyboard_string = "";
        console_input = "";
    }
}
