draw_sprite_ext(sprite_index,image_index,x,y,scale_x,scale_y,dir,c_white,1);

if(draw_fire_sprite) {
	fire_alpha = lerp(fire_alpha, 0, 0.15);
	draw_sprite_ext(sprite_fire,fire_index,x+fire_index,y,scale_x,scale_y,dir,c_red,fire_alpha);	
}