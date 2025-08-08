event_inherited();

if (!landed) {
    // Horizontal movement
    x += lengthdir_x(spd, dir);	
	
	//spd *= 0.98;

    // Vertical movement (gravity)
    vsp += grv;
    y += vsp;

    // Arc effect: pull direction toward downward over time
    dir = lerp_angle(dir, dir_to_go_to, lerp_value);

    // Landing check
    if (y >= landing_y) {
        landed = true;
        vsp = 0;
        spd = 0;

		vfx_lifetime = 10;

        //// Optionally: create a decal here
        instance_create_layer(x, y, "Decals", obj_decal_blood);
    }
}
