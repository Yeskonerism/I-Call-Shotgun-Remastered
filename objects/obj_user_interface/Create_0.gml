ui_version = 1;

ui_health_display = 0;
ui_dash_display = 0;

// debugging
enum DebugView {
	None,
	AudioManager,
	DebugStream,
	TimeEffect,
	PlayerValues,
	WorldValues
}

show_debug_mode = DebugView.None;

got_hit_flash = 0;
got_hit_flash_alpha = 0.5;