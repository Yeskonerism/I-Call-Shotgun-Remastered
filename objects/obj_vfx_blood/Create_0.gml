randomise();

event_inherited();

vfx_sprite = spr_vfx_blood;
vfx_lifetime = 300;

dir = 0;
start_dir = dir;
spd = random_range(1, 3);

// New vertical velocity and gravity
vsp = -random_range(-3, 3); // shoots upward
grv = 0.1;

image_angle = dir;
image_index = irandom_range(0, 4);

landed = false; // has it hit the ground?

landing_y = y + random_range(8,24);

lerp_value = random_range(0.05,0.1);

dir_to_go_to = 270 + irandom_range(-20,20);