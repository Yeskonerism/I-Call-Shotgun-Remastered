image_angle = dir;

var lx = lengthdir_x(spd,dir);
var ly = lengthdir_y(spd,dir);

if(place_free(x+lx,y+ly)) {
	x += lx;
	y += ly;
} else {
	vfx_create_sparks(x+lx, y+ly, 10, true, {
		sprite: spr_vfx_spark,
		color: c_yellow,
		alpha_start: 1,
		alpha_end: 0,
		scale_x: 0.5 + random_range(0,0.5),
		scale_y: 0.5 + random_range(0,0.5),
	});
	
	instance_destroy(self);
}