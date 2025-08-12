// Inherit the parent event
event_inherited();

vfx_lifetime = 30;
vfx_fade = true;
vfx_alpha_start = 1;
vfx_alpha_end = 0;
vfx_destroy_on_end = true;
vfx_timer = 0;

vfx_alpha = vfx_alpha_start;
vfx_color = c_red;

vfx_sprite = spr_vfx_explosion;

vfx_create_sparks(x, y, 100, true, {
		sprite: spr_vfx_spark,
		color: c_red,
		alpha_start: 1,
		alpha_end: 0,
		scale_x: 0.5 + random_range(0,0.5),
		scale_y: 0.5 + random_range(0,0.5),
});

image_xscale = 1.5;
image_yscale = 1.5;