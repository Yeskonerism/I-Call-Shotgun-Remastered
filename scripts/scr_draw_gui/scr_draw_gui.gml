#region gui box

function draw_gui_box(_x, _y, _xx, _yy, color, alpha){
	draw_set_colour(color);
	draw_set_alpha(alpha);
		draw_rectangle(_x,_y,_xx,_yy,false);
	
	reset_all_draw_values();
}

function draw_gui_box_midpoint(_x, _y, width, height, color, alpha){
	draw_set_colour(color);
	draw_set_alpha(alpha);
		draw_rectangle(_x - (width/2), _y - (height/2), _x + (width/2), _y + (height/2),false);
	
	reset_all_draw_values();
}

function draw_gui_box_label(_x, _y, _xx, _yy, color, alpha, label) {
	draw_gui_box(_x, _y, _xx, _yy, color, alpha);
	
	draw_text((_x + _xx)/2, (_y + _yy)/2, label);
		
	reset_all_draw_values();
}

function draw_gui_box_label_ext(_x, _y, _xx, _yy, color, alpha, label, label_color, label_alpha, halign, valign, font) {
	draw_gui_box(_x, _y, _xx, _yy, color, alpha);
	
	draw_set_color(label_color);
	draw_set_alpha(label_alpha);
	
	draw_set_font(font);
	draw_set_halign(halign);
	draw_set_valign(valign);
		draw_text((_x + _xx)/2, (_y + _yy)/2, label);
		
	reset_all_draw_values();
}

#endregion

#region labels

function draw_gui_label(_x,_y,label,color,alpha,font) {
	draw_set_color(color);
	draw_set_alpha(alpha);
	draw_set_font(font);
		draw_text(_x,_y,label);
		
	reset_all_draw_values();
}

function draw_gui_label_ext(_x,_y,label,color,alpha,font,halign,valign) {
	draw_set_color(color);
	draw_set_alpha(alpha);
	draw_set_font(font);
	draw_set_halign(halign);
	draw_set_valign(valign);
		draw_text(_x,_y,label);
		
	reset_all_draw_values();
}

#endregion