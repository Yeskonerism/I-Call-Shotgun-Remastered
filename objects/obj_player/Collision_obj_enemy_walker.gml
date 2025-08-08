if(!flash_active && flash_post_buffer > 0 && !iframes_active) {
	flash_active = true;	
	flash = 5;
	
	global.camera.screenshake(4);
	
	obj_user_interface.got_hit_flash = 10;
	
	audio_play_on_channel(9,snd_player_hit,false,"player sfx");
	
	vfx_create_blood_spray(x,y,point_direction(other.x,other.y,x,y),20,true);
	
	apply_damage(self, irandom_range(5,10), other);
}