if(mouse_check_button_pressed(mb_right)) {
	instance_create_layer(x,y,"Weapons",obj_weapon_shotgun);
	instance_destroy(self);
}