event_inherited();

spd *= 0.85; 
if (spd < 0.1) instance_destroy(); // Destroy when very slow

var lx = lengthdir_x(spd, move_dir);
var ly = lengthdir_y(spd, move_dir);

// Bounce logic
var bounced = false;

// Check horizontal wall
if (!place_free(x + lx, y)) {
    move_dir = 180 - move_dir; // reflect horizontally
    bounced = true;
}

// Check vertical wall
if (!place_free(x, y + ly)) {
    move_dir = 360 - move_dir; // reflect vertically
    bounced = true;
}

// Optional: add jitter or speed loss on bounce
if (bounced) {
    move_dir += random_range(-10, 10); // slight randomness
    spd *= 0.8; // lose speed on bounce
}

// Recalculate movement with possibly new direction
lx = lengthdir_x(spd, move_dir);
ly = lengthdir_y(spd, move_dir);

// Create trail
for (var i = 0; i < spd; i++) {
    var fx = x + (lx / spd * i);
    var fy = y + (ly / spd * i);
    
    vfx_create_trail(fx, fy, true, {
        sprite: vfx_sprite,
        color: vfx_color,
        alpha_start: 0.1,
        alpha_end: 0,
        scale_x: image_xscale,
        scale_y: image_yscale,
        angle: image_angle,
        lifetime: 10
    });
}

// Move spark
if (place_free(x + lx, y + ly)) {
    x += lx;
    y += ly;
}

image_angle += image_angular_speed;
image_alpha = lerp(image_alpha, 0, 0.2);
