// draw game title
draw_set_font(fnt_menu_interface_title);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
	draw_text(room_width/2, room_height/2 - 120,"I CALL SHOTGUN");
reset_all_draw_values();

// draw menu elements
menu.draw(room_width/2, room_height/2, 8, fnt_menu_interface, fa_center, fa_middle, c_red, c_yellow);