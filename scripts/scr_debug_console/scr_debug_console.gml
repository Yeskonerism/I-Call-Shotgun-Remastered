/// @param command_str
function console_parse_command(command_str) {
	var args = string_split(command_str, " ");

	switch (args[0]) {
	    case "player":
	        if(instance_exists(obj_player))
				array_push(console_output, "Player object is active");
			else
				array_push(console_output, "Player object is inactive or dead");
			break;

	    case "player_health":
	        if (array_length(args) > 1) {
	            obj_player.health_points = real(args[1]);
	            array_push(console_output, "Player health set to " + string(obj_player.health_points));
	        }
	        break;

	    case "player_health_max":
	        if (array_length(args) > 1) {
	            obj_player.max_health_points = real(args[1]);
	            array_push(console_output, "Player max health set to " + string(obj_player.max_health_points));
	        }
	        break;

	    case "player_health_heal":
	        if (array_length(args) > 1) {
	            obj_player.health_points = clamp(obj_player.health_points + real(args[1]), 0, obj_player.max_health_points);
	            array_push(console_output, "Healed to " + string(obj_player.health_points));
	        }
	        break;

	    case "player_health_hurt":
	        if (array_length(args) > 1) {
	            global.player_health = max(0, global.player_health - real(args[1]));
	            array_push(console_output, "Hurt to " + string(global.player_health));
	        }
	        break;
			
	    default:
	        array_push(console_output, "Unknown command: " + args[0]);
	}
}
