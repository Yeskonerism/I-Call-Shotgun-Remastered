menu_play = function() {
	room_fade_transition(rm_test);
}

menu_exit = function() {
	game_end(0);
}

menu = menu_create(["play","exit"],[menu_play,menu_exit]);

title_angle = 1;
title_angle_rotate_direction = -1;
title_angle_time = 0;                // internal timer
title_angle_speed = 0.05;            // speed of oscillation
title_angle_max = 5;                // maximum angle