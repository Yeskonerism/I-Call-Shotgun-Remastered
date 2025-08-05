// the original i call shotgun UI design
function gui_draw_version_0(gui_w, gui_h, box_heights, box_widths, box_margin) {
	var mid_box_x = gui_w/2;
	var mid_box_y = gui_h - 64;	
	
	var dashbar_spacing = 8;
	var dashbar_height = 16;
	var dashbar_top = mid_box_y + dashbar_spacing*3;
	var dashbar_bottom = dashbar_top + dashbar_height;
	var dashbar_seperator = 8;
	var dashbar_mid = (mid_box_x);
	
	var dashbar_left = mid_box_x - box_widths/2 + dashbar_seperator;
	var dashbar_right = mid_box_x + box_widths/2 - dashbar_seperator;
	
	// middle box
	// health
	draw_gui_box_midpoint(mid_box_x, mid_box_y, box_widths, box_heights, c_black, 0.5);
	
	// health box title
	draw_gui_label_ext(mid_box_x, mid_box_y - box_heights/2, "HEALTH", c_white, 0.5, fnt_user_interface_sub, fa_center, fa_top);
	
	// health display
	if(instance_exists(obj_player)) {
		draw_gui_label_ext(mid_box_x, mid_box_y, string(obj_player.health_points) + "/" + string(obj_player.max_health_points), c_white, 1, fnt_user_interface, fa_center, fa_middle);
	} else {
		draw_gui_label_ext(mid_box_x, mid_box_y, "DEAD?!", c_red, 1, fnt_user_interface, fa_center, fa_middle);	
	}
	
	// Dash bar 1 (0–100)
	draw_healthbar(
		dashbar_left,
		dashbar_top,
		dashbar_mid - dashbar_seperator / 2,
		dashbar_bottom,
		clamp(ui_dash_display, 0, 100),
		c_black,
		c_aqua,
		c_aqua,
		180,
		true,
		false
	);

	// Dash bar 2 (100–200)
	draw_healthbar(
		dashbar_mid + dashbar_seperator / 2,
		dashbar_top,
		dashbar_right,
		dashbar_bottom,
		clamp(ui_dash_display - 100, 0, 100),
		c_black,
		c_aqua,
		c_aqua,
		180,
		true,
		false
	);
	
	
	// left box
	// ammo (TODO obj_weapon_parent)
	draw_gui_box_midpoint(mid_box_x - (box_widths + box_margin), mid_box_y, box_widths, box_heights, c_black, 0.5);
	
	// ammo box title
	draw_gui_label_ext(mid_box_x - (box_widths + box_margin), mid_box_y - box_heights/2, "AMMO", c_white, 0.5, fnt_user_interface_sub, fa_center, fa_top);
	
	
	// right box
	// weapon (TODO obj_weapon_parent)
	draw_gui_box_midpoint(mid_box_x + (box_widths + box_margin), mid_box_y, box_widths, box_heights, c_black, 0.5);
	
	// weapon box title
	draw_gui_label_ext(mid_box_x + (box_widths + box_margin), mid_box_y - box_heights/2, "WEAPON", c_white, 0.5, fnt_user_interface_sub, fa_center, fa_top);
}