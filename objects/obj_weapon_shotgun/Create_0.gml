randomise();

// Inherit the parent event
event_inherited();

magazine_size = 5;
magazine_size_reset = magazine_size;

sprite_idle = spr_weapon_shotgun;
sprite_rack = spr_weapon_shotgun_rack;
sprite_fire = spr_weapon_shotgun_fire;

primary_fire = function() {
	if(shot_timer == 0 && magazine_size > 0) {
		audio_play_on_channel(8, snd_shotgun_shoot, false, "SFX");
		
		sprite_index = sprite_rack;
	
		magazine_size--;
	
		shot_timer = 45;
		recoil = 4;
		
		draw_fire_sprite = true;
		
		var shell_angle = point_direction(x, y, mouse_x, mouse_y) + random_range(60, 100); // tweak this
		var shell = instance_create_layer(x, y, "VFXMid", obj_decal_shotgun_shell);
		shell.dir = shell_angle;
		
		// shoot bullets
		for(var i = 0; i < 5; i++) {
			var random_offset = random_range(-5,5);
			
			var inst = instance_create_layer(x,y,layer,obj_shotgun_bullet);
			inst.dir = dir + random_offset;
		}
	} else if(magazine_size == 0) {
		reload_timer = reload_timer_max;
		reloading = true;	
	}
}

secondary_fire = function() {
	
}