text = "Default dialogue text here."; // Set this in trigger
display_time = 120; // frames
auto_close = true;

close_on_key = true;
close_key = vk_space;

close_on_mouse = false;
close_mouse = mb_right;

timer = display_time;

// Text padding around edges
padding_x = 32;
padding_y = 16;

// Max width before wrapping
wrap_width = 480;

font = undefined;

end_on_event	= false;
end_event = function() {}; // must return true or false