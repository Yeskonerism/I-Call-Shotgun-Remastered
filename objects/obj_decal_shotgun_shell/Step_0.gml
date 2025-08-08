if (!landed) {
    // Apply horizontal movement
    x += lengthdir_x(spd, dir);

    // Apply gravity
    vsp += grv;
    y += vsp;

    // Arc the direction downward over time
    dir = lerp_angle(dir, 270, lerp_value);

    // Rotate based on vertical speed
    image_angle += spd * 2;

    // Landing logic
    if (y >= landing_y) {
        y = landing_y;
        landed = true;

        // Optional: snap shell to angle or stop motion
        spd = 0;
        vsp = 0;
        image_speed = 0;
        image_angle = round(image_angle / 45) * 45; // Snap to nearest 45°
    } else if(place_meeting(x,y+vsp,obj_solid)) {
        landed = true;

        // Optional: snap shell to angle or stop motion
        spd = 0;
        vsp = 0;
        image_speed = 0;
        image_angle = round(image_angle / 45) * 45; // Snap to nearest 45°			
	}
}
