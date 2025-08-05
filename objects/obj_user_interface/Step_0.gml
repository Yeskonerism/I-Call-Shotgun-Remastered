ui_health_display = lerp(ui_health_display, obj_player.health_points, 0.1);
ui_dash_display = lerp(ui_dash_display, obj_player.dash_value, 0.1);

// Press keys
if (keyboard_check_pressed(vk_f1)) show_debug_mode = (show_debug_mode == DebugView.AudioManager) ? DebugView.None : DebugView.AudioManager;
if (keyboard_check_pressed(vk_f2)) show_debug_mode = (show_debug_mode == DebugView.DebugStream) ? DebugView.None : DebugView.DebugStream;
if (keyboard_check_pressed(vk_f3)) show_debug_mode = (show_debug_mode == DebugView.TimeEffect) ? DebugView.None : DebugView.TimeEffect;
if (keyboard_check_pressed(vk_f4)) show_debug_mode = (show_debug_mode == DebugView.PlayerValues) ? DebugView.None : DebugView.PlayerValues;
if (keyboard_check_pressed(vk_f5)) show_debug_mode = (show_debug_mode == DebugView.WorldValues) ? DebugView.None : DebugView.WorldValues;

var scroll = mouse_wheel_down() - mouse_wheel_up(); // Mouse wheel input
global.debug_scroll_offset += scroll;

var max_scroll = max(0, array_length(global.debug_stream_lines) - global.debug_max_lines_visible);
global.debug_scroll_offset = clamp(global.debug_scroll_offset, 0, max_scroll);