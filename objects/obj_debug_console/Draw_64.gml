// Draw GUI Event
if (console_active) {
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), 200, false);
    draw_set_color(c_white);
    draw_text(10, 10, "> " + console_input);
    
    var _y = 30;
    var lines = array_length(console_output);
    var start = max(0, lines - max_output_lines);
    for (var i = start; i < lines; i++) {
        draw_text(10, _y, console_output[i]);
        _y += 16;
    }
}
