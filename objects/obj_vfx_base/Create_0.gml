vfx_lifetime= 30;
vfx_fade = true;
vfx_alpha_start = 1;
vfx_alpha_end = 0;
vfx_destroy_on_end = true;
vfx_timer = 0;

vfx_alpha = vfx_alpha_start;
vfx_color = c_white;

vfx_sprite = noone;

if(vfx_sprite != noone) {
	sprite_index = vfx_sprite;
	image_index = 0;
}

if(global.vfx_count < global.vfx_limit) {
	global.vfx_count++;
}
else {
	debug_stream_add("Could not initialise object type: VFX\nglobal.vfx_count has reached its limit [10000]")
	instance_destroy(self);
}