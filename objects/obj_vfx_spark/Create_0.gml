// Create Event
event_inherited();

move_dir = random(360);
spd = random_range(3, 12); // faster speed

vfx_lifetime = irandom_range(6, 10); // short lifespan in frames

image_angle = move_dir;
image_angular_speed = irandom_range(-20, 20);