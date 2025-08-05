#region player gui/hud

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

var box_widths = 256;
var box_heights = 92;

var box_margin = 16;

switch(ui_version) {
case 0:
	gui_draw_version_0(gui_w, gui_h, box_heights, box_widths, box_margin);
	break;
case 1:
	gui_draw_version_1(gui_w, gui_h, box_heights, box_widths, box_margin, ui_health_display);
	break;
}	

#endregion

#region debugging

if(global.debug) {
	var start_x = 8;
	var start_y = 32;
	var line_height = 16;
	
	switch(show_debug_mode) {
	case DebugView.AudioManager:
		draw_debug_audio_manager(start_x, start_y, line_height);
		break;
	case DebugView.DebugStream:
		draw_debug_stream(start_x, start_y, line_height);
		break;
	case DebugView.TimeEffect:
		draw_debug_time_effect(start_x, start_y, line_height);
		break;
	case DebugView.PlayerValues:
		draw_debug_player_values(start_x, start_y, line_height);
		break;
	case DebugView.WorldValues:
		draw_debug_world_values(start_x, start_y, line_height);
		break;
	}
	
	draw_debug_key_reference();
}

#endregion