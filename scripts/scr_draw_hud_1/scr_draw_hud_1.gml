function gui_draw_version_1(gui_w, gui_h, box_heights, box_widths, box_margin, ui_health_display) {
	var bottom_box_top = gui_h - (box_heights);
	var bottom_box_bottom = gui_h - box_margin;

	var bottom_box_middle_x = (box_margin * 2 + box_widths) / 2;
	var bottom_box_middle_y = (bottom_box_top + bottom_box_bottom) / 2;

	var top_box_top = gui_h - (box_heights * 2 + box_margin);
	var top_box_bottom = gui_h - (box_heights + box_margin / 2);

	var healthbar_margin = 8;
	var healthbar_top = bottom_box_top + healthbar_margin;
	var healthbar_bottom = healthbar_top + 32;
	var healthbar_left = box_margin + healthbar_margin;
	var healthbar_right = (box_margin + box_widths) - healthbar_margin;

	var dashbar_spacing = 8;
	var dashbar_height = 16;
	var dashbar_top = healthbar_bottom + dashbar_spacing;
	var dashbar_bottom = dashbar_top + dashbar_height;
	var dashbar_seperator = 8;
	var dashbar_mid = (healthbar_left + healthbar_right) / 2;

	// Bottom box (health & dash)
	draw_gui_box(box_margin, bottom_box_top, box_margin + box_widths, bottom_box_bottom, c_black, 0.5);

	// Health bar
	draw_healthbar(healthbar_left, healthbar_top, healthbar_right, healthbar_bottom, ui_health_display, c_black, c_red, c_red, 180, true, false);

	// Health text
	draw_gui_label_ext(
		bottom_box_middle_x,
		healthbar_top + 16,
		string(round(ui_health_display)) + "/100",
		c_white,
		1,
		fnt_user_interface,
		fa_center,
		fa_middle
	);

	// Dash bar 1 (0–100)
	draw_healthbar(
		healthbar_left,
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
		healthbar_right,
		dashbar_bottom,
		clamp(ui_dash_display - 100, 0, 100),
		c_black,
		c_aqua,
		c_aqua,
		180,
		true,
		false
	);

	// Top box (weapon/ammo)
	draw_gui_box(box_margin, top_box_top, box_margin + box_widths, top_box_bottom, c_black, 0.5);
	
	var weapon_display_draw_color = c_white;
	
	if(instance_exists(obj_weapon_shotgun)) {
		var text = ""
		var wep_img = 0;
		
		if(!obj_weapon_shotgun.reloading)
			if(obj_weapon_shotgun.magazine_size > 0) {
				//text = "" + string(obj_weapon_shotgun.magazine_size) + " shells";
				text = "Weapon"
				wep_img = obj_weapon_shotgun.magazine_size;
			} else {
				text = "empty";
				weapon_display_draw_color = c_red;
			}
		else {
			weapon_display_draw_color = c_aqua;
			
			if(obj_weapon_shotgun.reload_timer > 40)
				text = "Reloading.";
			else if(obj_weapon_shotgun.reload_timer > 20 && obj_weapon_shotgun.reload_timer <= 40)
				text = "Reloading..";
			else
				text = "Reloading...";
				
			var increment = obj_weapon_shotgun.reload_timer_max / obj_weapon_shotgun.magazine_size_reset;
		}
		
		draw_gui_label_ext(bottom_box_middle_x,top_box_top + box_margin/2,text,weapon_display_draw_color,1,fnt_user_interface_sub,fa_center,fa_top);
		draw_sprite_ext(spr_weapon_shotgun_hud,wep_img,bottom_box_middle_x,top_box_bottom - ((box_heights/2) - box_margin),1,1,0,weapon_display_draw_color,1);
	} else {}
		
}