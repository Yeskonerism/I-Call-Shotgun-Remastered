if(downscale_time > 0) {
	downscale_time--;
} else {
	if(scale > 0) scale -= downscale_speed;
	else instance_destroy(self);
}

image_xscale = scale;
image_yscale = scale;

if(spd > 0) spd -= 0.25;
else spd = 0;

var lx = lengthdir_x(spd,image_angle);
var ly = lengthdir_y(spd,image_angle);

if(!place_meeting(x+lx,y+ly-8,obj_solid)) {
	x += lx;
	y += ly;
}

if(place_meeting(x,y,obj_solid)) {
	instance_destroy(self);	
}