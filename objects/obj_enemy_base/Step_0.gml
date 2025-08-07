if(instance_exists(target)) {
	target_obj_pos = [target.x,target.y];
	
	detection_angle = point_direction(x,y,target.x,target.y);
	
	switch(state) {
	case "idle":
		break;

	case "alert":
		break;
	
	case "check out":
		detection_timer = 0;
		
		event_user(0);

		state = "checking out";
	
		break;

	case "checking out":
		detection_timer = 0;

		if(target_pos[0] >= x) draw_xscale = 1;
		else draw_xscale = -1;

		if(distance_to_point(target_pos[0],target_pos[1]) <= 4) {
			if(instance_exists(target)) {

				if(collision_line(x, y, target_obj_pos[0], target_obj_pos[1], obj_solid, true, false) || distance_to_object(target) > detection_range
					|| collision_line(x, y, target_obj_pos[0], target_obj_pos[1], obj_solid, true, false) && distance_to_object(target) > detection_range)
					state = "nothing here";
			} else {
				state = "nothing here";	
			}
		}
	
		break;

	case "nothing here":
		detection_timer = 0;
	
		nothing_here_timer--;
		
		if(nothing_here_timer <= 0) {
			nothing_here_timer = nothing_here_timer_reset	
	
			state = "going back";
		
			event_user(1);
		}
	
		break;
		
	case "going back":
		detection_timer = 0;
		
		if(start_pos[0] >= x) draw_xscale = 1;
		else draw_xscale = -1;

		if(distance_to_point(start_pos[0],start_pos[1]) <= 4) {
			detection_timer = detection_timer_reset;
			state = "idle";
		}

		break;
	case "attack":
		var sight_line = collision_line(x,y,target.x,target.y,obj_solid, true, true);
	
		var distance = distance_to_object(target);
		
		if(!sight_line && distance <= detection_range) target_pos = [target.x, target.y];
	
		path_end();
		
	    if (attack_timer > 0) {
	        attack_timer--;
	    } else {
	        attack_timer = attack_timer_reset;
	        if(previous_state == "checking out") state = "check out";
			else if(previous_state == "attack") state = "check out";
			else state = previous_state;
	    }
		break;
	}
}

if(state == "going back" || state == "checking out") {
	if(target_pos[0] > x + 8) draw_angle = lerp(draw_angle,5 * -draw_xscale,0.1);	
	else if(target_pos[0] < x) draw_angle = lerp(draw_angle,5 * -draw_xscale,0.1);	
	else draw_angle = lerp(draw_angle,0,0.1);
} else draw_angle = lerp(draw_angle,0,0.1);