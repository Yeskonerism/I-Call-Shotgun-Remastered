if(iframes_active) draw_alpha = 0.75;
else draw_alpha = 1;

draw_sprite_ext(sprite_index,image_index,x,y,draw_xscale,image_yscale,draw_angle,draw_color,draw_alpha);

if(flash > 0) {
	flash--;
	
	shader_set(shd_red_flash);
		draw_sprite_ext(sprite_index,image_index,x,y,draw_xscale,image_yscale,draw_angle,draw_color,draw_alpha);
	shader_reset();
} else {
	if(flash_active) {
		if(flash_post_buffer > 0) flash_post_buffer--;	
		else { flash_active = false; flash_post_buffer = 15 }
	}
}