image_speed = 0;

image_angle = random(360);

image_xscale = 0.5 + random_range(0,0.5);
image_yscale = 0.5 + random_range(0,0.5);

image_index = irandom_range(0,4);

if(place_meeting(x,y,obj_solid)) instance_destroy(self);

global.decal_count++;