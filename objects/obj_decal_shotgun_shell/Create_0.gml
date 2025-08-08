event_inherited();

dir = undefined;

start_dir = dir;
spd = random_range(1.5, 3); // Ejection force
vsp = -random_range(1, 2);  // Initial upward velocity
grv = 0.15;

landing_y = y + random_range(24, 36); // Simulated ground
landed = false;

lerp_value = random_range(0.05, 0.1);
image_angle = random(360);
image_speed = 0;