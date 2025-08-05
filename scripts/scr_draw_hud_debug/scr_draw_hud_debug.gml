// key list
// f1 - show audio manager
// f2 - show debug stream
// f3 - show time/effect
// f4 - show player values
// f5 - show world values
function draw_debug_key_reference() {
	var _x = display_get_gui_width() - 280;
	var _y = display_get_gui_height() - 120;

	draw_set_color(c_white);
	draw_text(_x, _y, 
		"F1: Audio Manager\n" +
		"F2: Debug Stream\n" +
		"F3: Time/Effect Values\n" +
		"F4: Player Values\n" +
		"F5: World Values"
	);
}

function draw_debug_audio_manager(start_x, start_y, line_height) {
	// audio manager debug UI
	draw_text(start_x,8,"audio manager:");
	
	for(var i = 0; i < array_length(global.audio_channels); i++) {
		if(global.audio_channels[i].sound != undefined) {
			draw_text(
				start_x, 
				start_y + line_height * i, 
				"Channel " + string(i) + ": " + string(audio_get_name(global.audio_channels[i].sound))
			);
		} else {
			draw_text(start_x, start_y + line_height * i, "Channel " + string(i) + ": ---");
		}
	}	
}

function draw_debug_stream(start_x, start_y, line_height) {
	draw_text(start_x, 8, "debug stream:");
	
	var start_line = global.debug_scroll_offset;
	var end_line = min(start_line + global.debug_max_lines_visible, array_length(global.debug_stream_lines));
	
	for (var i = start_line; i < end_line; i++) {
		draw_text(start_x, start_y + (i - start_line) * line_height, global.debug_stream_lines[i]);
	}
}

function draw_debug_time_effect(start_x, start_y, line_height) {
	draw_text(start_x, 8, "Time/effect values:");
	
	draw_text(start_x, start_y, "FPS: " + string(fps));
	draw_text(start_x, start_y + line_height, "Delta time: " + string(delta_time/1000000));
	draw_text(start_x, start_y + line_height*2,"Paused: " + string(global.paused));	
}

function draw_debug_player_values(start_x, start_y, line_height) {
	if(instance_exists(obj_player)) {
		draw_text(start_x, 8, "Player values:");
			
		draw_text(start_x,start_y,"x pos: " +										string(obj_player.x));
		draw_text(start_x,start_y + line_height,"y pos: " +							string(obj_player.y));
		draw_text(start_x,start_y + line_height*2,"Health: " +						string(obj_player.health_points));
		draw_text(start_x,start_y + line_height*3,"H-speed: " +						string(obj_player.hsp));
		draw_text(start_x,start_y + line_height*4,"V-speed: " +						string(obj_player.vsp));
		draw_text(start_x,start_y + line_height*5,"Dash value: " +					string(obj_player.dash_value));
		draw_text(start_x,start_y + line_height*6,"Can dash: " +					string(obj_player.can_dash));
		draw_text(start_x,start_y + line_height*7,"Dashes: " +						string(obj_player.dashes));
		draw_text(start_x,start_y + line_height*8,"Draw xscale: " +					string(obj_player.draw_xscale));
		draw_text(start_x,start_y + line_height*9,"Draw angle: " +					string(obj_player.draw_angle));
		draw_text(start_x,start_y + line_height*10,"Draw color: " +					string(obj_player.draw_color));
		draw_text(start_x,start_y + line_height*11,"Draw alpha: " +					string(obj_player.draw_alpha));
	}	
}

function draw_debug_world_values(start_x, start_y, line_height) {
	draw_text(start_x, 8, "world values:");
		
	draw_text(start_x,start_y,"World object count: " + string(global.world_object_count));
	draw_text(start_x,start_y + line_height,"Entity count: " + string(global.entity_count));
	draw_text(start_x,start_y + line_height*2,"VFX count: " + string(global.vfx_count));	
}