if(!flash_active && flash_post_buffer > 0) {
	flash_active = true;	
	flash = 5;
	
	apply_damage(self, irandom_range(5,10), other);
}