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
        while (!place_free(x + dx, y + dy) && attempt < max_attempts && !place_meeting(x+dx,y+dy,obj_destructable)) {
            var reduced_speed = dash_speed - attempt;
            dx = lengthdir_x(reduced_speed, snapped_angle);
            dy = lengthdir_y(reduced_speed, snapped_angle);
            attempt++;
        }

        // Only move if a valid dash space was found
        if (!place_meeting(x + dx, y + dy,obj_solid) && !collision_line(x,y,x+lengthdir_x(max_attempts-attempt,snapped_angle),y+lengthdir_y(max_attempts-attempt,snapped_angle),obj_solid,true,true) && dash_value > 100) {
            // create dash trail
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
			
			// play dash sfx
			audio_play_on_channel( 1, snd_dash, false, "sfx" );
			
			// reduce player dash value
			dash_value -= 100;
			
			// calculate enemies to damage if enemies are inline
			var enemies_hit = collision_line_width_list(x, y, x+dx, y+dy, 16, obj_enemy_base, true, true);
			
			if(enemies_hit) {
				for (var i = 0; i < ds_list_size(enemies_hit); i++) {
					var enemy = enemies_hit[| i];
				    if (instance_exists(enemy)) {
				        with (enemy) {
							event_user(2)
				            apply_damage(self,50);
				        }
				    }
				}
			}
			
			// calculate destructable objects to damage if enemies are inline
			var destructibles_hit = collision_line_width_list(x, y, x+dx, y+dy, 16, obj_destructable, true, true);

			if (destructibles_hit) {
			    for (var i = 0; i < ds_list_size(destructibles_hit); i++) {
			        var dest = destructibles_hit[| i];
			        if (instance_exists(dest)) {
			            with (dest) {
			                apply_damage(self,9999);
			            }
			        }
			    }
			}
			
			iframes_active = true;
			
			x += dx;
            y += dy;
		} else {
            // Optional: play a failed dash sound or effect
			debug_stream_add("Player dash failed");
        }
    }
}
	
function keycard_add(_p, _id) {
    _p.keycards[? _id] = true;
}

function keycard_remove(_p, _id) {
    if (ds_map_exists(_p.keycards, _id)) ds_map_delete(_p.keycards, _id);
}

function keycard_has(_p, _id) {
    return ds_map_exists(_p.keycards, _id) && (_p.keycards[? _id] == true);
}
