if(image_alpha > 0) {
	image_alpha-=0.005;	
}

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