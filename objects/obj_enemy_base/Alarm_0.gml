if(instance_exists(target)) {
	last_frame_pos = [x,y];
	
	//var sightLine = CollisionLineExt(x,y,objPlayer.x,objPlayer.y,spd,objDashCheckThingyMajig, objParentDoor);
	var sight_line = collision_line(x,y,target.x,target.y,obj_solid, true, true);
	
	var distance = distance_to_object(target);

	if(!sight_line && distance <= detection_range) {
		if(detection_timer > 0) detection_timer -= 1;
	} else {
		detection_timer = detection_timer_reset;	
	}
		
	if(detection_timer <= 0) {
		if(state != "attack") {
			state = "check out";
			
			if(distance_to_object(obj_enemy_base) < 8)
				target_pos = [target.x+irandom_range(-8,8), target.y+irandom_range(-8,8)];
			else
				target_pos = [target.x, target.y];
		}
	}
		
}
	
		
alarm[0] = ai_refresh;