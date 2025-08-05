vfx_timer++;

if(vfx_fade) {
	vfx_alpha = lerp(vfx_alpha_start, vfx_alpha_end, vfx_timer / vfx_lifetime);	
}

if(vfx_timer >= vfx_lifetime) {
	instance_destroy(self);	
}