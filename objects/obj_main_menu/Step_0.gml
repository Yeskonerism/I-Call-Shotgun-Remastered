// Direction change
if (title_angle >= title_angle_max) {
    title_angle_rotate_direction = -1;
} else if (title_angle <= -title_angle_max) {
    title_angle_rotate_direction = 1;
}

title_angle_time += title_angle_speed;
title_angle = sin(title_angle_time) * title_angle_max;

if(keyboard_check(vk_escape)) {
	if(exit_tick < 60) exit_tick++;
	else game_end(0);
} else exit_tick = 0;

menu.update(keyboard_check_pressed(vk_down),keyboard_check_pressed(vk_up),keyboard_check_pressed(vk_enter));