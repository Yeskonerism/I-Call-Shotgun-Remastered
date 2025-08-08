function player_dash(hsp,vsp){
	// Only dash if there's movement input
    if (hsp != 0 || vsp != 0) {
        var angle = point_direction(0, 0, hsp, vsp);
        var snapped_angle = round(angle / 45) * 45;

        var dash_speed = 32;
        var dx = lengthdir_x(dash_speed, snapped_angle);
        var dy = lengthdir_y(dash_speed, snapped_angle);

        var max_attempts = dash_speed; // max fallback iterations
        var attempt = 0;

        // Obstacle check — reduce dash distance if needed
        while (!place_free(x + dx, y + dy) && attempt < max_attempts) {
            var reduced_speed = dash_speed - attempt;
            dx = lengthdir_x(reduced_speed, snapped_angle);
            dy = lengthdir_y(reduced_speed, snapped_angle);
            attempt++;
        }

        // Only move if a valid dash space was found
        if (place_free(x + dx, y + dy) && !collision_line(x,y,x+lengthdir_x(max_attempts-attempt,snapped_angle),y+lengthdir_y(max_attempts-attempt,snapped_angle),obj_solid,true,true) && dash_value > 100) {
            for(var i = 0; i < 4; i++) {
				vfx_create_trail(x + (dx/4 * i), y + (dy/4 * i), true, {
					sprite: spr_player,
					color: c_red,
					alpha_start: 0.5,
					alpha_end: 0,
					scale_x: draw_xscale,
					scale_y: 1,
					angle: draw_angle,
					lifetime: 30
					}
				)
			}
			
			audio_play_on_channel( 1, snd_dash, false, "sfx" );
			
			dash_value -= 100;
			
			var max_hits = 3;
			var list = ds_list_create();
			var hit_count = collision_line_list(
				x - lengthdir_x(sprite_get_width(sprite_index)/2,snapped_angle), 
				y - lengthdir_y(sprite_get_height(sprite_index)/2,snapped_angle), 
				x + dx + lengthdir_x(sprite_get_width(sprite_index)/2,snapped_angle), 
				y + dy + lengthdir_y(sprite_get_height(sprite_index)/2, snapped_angle), 
				obj_enemy_base, 
				true, 
				true, 
				list, 
				true
			);
			
			for (var i = 0; i < min(hit_count, max_hits); i++) {
			    var enemy = list[| i];
			    if (instance_exists(enemy)) {
			        with (enemy) {
						event_user(2)
			            apply_damage(self,50);
			        }
			    }
			}
			
			ds_list_destroy(list);
			
			iframes_active = true;
			
			x += dx;
            y += dy;
        } else {
            // Optional: play a failed dash sound or effect
			debug_stream_add("Player dash failed");
        }
    }
}