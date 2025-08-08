if(!flash_active && flash_post_buffer > 0) {
	flash_active = true;	
	flash = 5;
	
	global.camera.screenshake(4);
	
	obj_user_interface.got_hit_flash = 10;
	
	apply_damage(self, irandom_range(5,10), other);
}