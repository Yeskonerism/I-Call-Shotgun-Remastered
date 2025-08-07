if(instance_exists(target)) {
	x = target.x + lengthdir_x(-recoil,dir);	
	y = target.y + lengthdir_y(-recoil,dir);
	
	if(target == obj_player) {
		dir = point_direction(x,y,mouse_x,mouse_y);	
	}
}

if(mouse_check_button_pressed(button_fire_primary)) {
	if(!reloading)
		primary_fire();	
}

if(mouse_check_button_pressed(button_fire_secondary)) {
	secondary_fire();	
}

if(keyboard_check_pressed(ord("R"))) {
	reload_timer = reload_timer_max;
	reloading = true;
}

if(shot_timer > 0) shot_timer--;	
else sprite_index = sprite_idle;
if(recoil > 0) recoil--;

// animation of sorts
if(mouse_x < x) scale_y = -1;
else scale_y = 1;

if(draw_fire_sprite) {
	if(fire_index < sprite_get_number(sprite_fire)-1) fire_index+=0.35;
	else { draw_fire_sprite = false; fire_index = 0; fire_alpha = 1;}
}	

//if(sprite_fire != undefined) {
//	fire_index_increment = sprite_get_number(sprite_fire) / sprite_fire.image_speed;	
//}

if(reload_timer > 0) reload_timer--;
else {
	if(reloading) {
		magazine_size = magazine_size_reset
		reloading = false;
	}
}