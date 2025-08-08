// draw game title
draw_set_font(fnt_menu_interface_title);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
	draw_text_transformed_color(room_width/2 + 4, room_height/2 - 120 + 4,"I CALL SHOTGUN", 1, 1, title_angle, c_black,c_black,c_black,c_black,0.5);
	draw_text_transformed_color(room_width/2, room_height/2 - 120,"I CALL SHOTGUN", 1, 1, title_angle, c_white,c_white,c_white,c_white,1);
reset_all_draw_values();

draw_gui_box_midpoint_round(room_width/2,room_height/2,192,92,c_black,0.5);

// draw menu elements
menu.draw(room_width/2, room_height/2, 8, fnt_menu_interface, fa_center, fa_middle, c_red, c_yellow);