// Direction change
if (title_angle >= title_angle_max) {
    title_angle_rotate_direction = -1;
} else if (title_angle <= -title_angle_max) {
    title_angle_rotate_direction = 1;
}

title_angle_time += title_angle_speed;
title_angle = sin(title_angle_time) * title_angle_max;

menu.update(keyboard_check_pressed(vk_down),keyboard_check_pressed(vk_up),keyboard_check_pressed(vk_enter));