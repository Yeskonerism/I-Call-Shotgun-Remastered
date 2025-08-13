if(image_alpha < 1) image_alpha += 0.05;

vfx_create_sparks(x + sprite_width,y,2,true,{
	sprite: spr_vfx_spark,
	color: c_red,
	alpha_start: 1,
	alpha_end: 0,
	scale_x: 0.5 + random_range(0,0.5),
	scale_y: 0.5 + random_range(0,0.5),
});

if(!place_meeting(x + 2,y,obj_solid)) {
	image_xscale+=2;
}