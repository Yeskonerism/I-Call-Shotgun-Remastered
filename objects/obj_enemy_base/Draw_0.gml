draw_sprite_ext(sprite_index,image_index,x,y,draw_xscale,image_yscale,draw_angle,c_white,1);

if(flash > 0) {
	flash--;
	
	shader_set(shd_red_flash);
		draw_sprite_ext(sprite_index,image_index,x,y,draw_xscale,image_yscale,draw_angle,c_white,1);
	shader_reset();
}