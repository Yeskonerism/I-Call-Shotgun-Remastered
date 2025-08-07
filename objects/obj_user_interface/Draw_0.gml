if(global.debug) {
	if(show_debug_mode == DebugView.WorldValues) {
		// draw solid object collision box
		var tile_size = 16;
		
		for(var _y = 0; _y < room_height; _y += tile_size) {
			for(var _x = 0; _x < room_width; _x += tile_size) {
				var inst = instance_position(_x, _y, obj_solid);
				
				if(inst != noone) {
				    var obj_id = instance_id_get(inst);
    
					var mask_w = sprite_get_bbox_right(obj_solid.sprite_index) - sprite_get_bbox_left(obj_solid.sprite_index);
					var mask_h = sprite_get_bbox_bottom(obj_solid.sprite_index) - sprite_get_bbox_top(obj_solid.sprite_index);
					
				    // If no solid below, halve mask_h
				    var below_inst = instance_position(inst.x, inst.y + tile_size, obj_solid);
				    if (below_inst == noone) {
				        mask_h /= 2;
				    }
    
				    // Draw rectangle based on collision mask size, centered on instance position
				    var left = inst.x;
				    var right = inst.x + mask_w;
				    var top = inst.y;
				    var bottom = inst.y + mask_h;
    
				    draw_set_alpha(0.5);
				    draw_set_color(c_blue);
						draw_rectangle(left, top, right, bottom, false);
				    
					reset_all_draw_values();
                }
			}
		}
		
		
		// draw player collision box
		if(instance_exists(obj_player)) {
			draw_set_alpha(0.5);
			draw_set_color(c_red);
				draw_rectangle(obj_player.bbox_left, obj_player.bbox_top, obj_player.bbox_right, obj_player.bbox_bottom, true);
			
			reset_all_draw_values();
		}
		
		if(instance_exists(obj_enemy_base)) {
			for(var i = 0; i < instance_number(obj_enemy_base); i++) {
				var inst = instance_find(obj_enemy_base,i);
				
				draw_set_alpha(0.5);
				draw_set_color(c_red);
					draw_rectangle(inst.bbox_left, inst.bbox_top, inst.bbox_right, inst.bbox_bottom, true);
				
					draw_line_width(inst.x,inst.y,inst.x+lengthdir_x(inst.detection_range, inst.detection_angle),inst.y+lengthdir_y(inst.detection_range, inst.detection_angle),2);
				
					draw_circle(inst.x,inst.y,inst.detection_range, true);
				
					draw_rectangle(inst.target_pos[0]-4,inst.target_pos[1]-4,inst.target_pos[0]+4,inst.target_pos[1]+4, false);
				reset_all_draw_values();
			}
			
		}
	}
}