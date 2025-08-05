//draw_sprite_ext(sprite_index,image_index,x+1*scale,y+1*scale,scale,scale,0,c_black,0.3);
//draw_sprite_ext(sprite_index,image_index,x,y,scale,scale,0,c_white,1);

x=mouse_x;
y=mouse_y;

var gui_x = device_mouse_x_to_gui(0);
var gui_y = device_mouse_y_to_gui(0);

var cursor_x = gui_x// - camera_x;
var cursor_y = gui_y //- camera_y;

//draw_sprite_ext(sprite_index,image_index,cursor_x+1*scale,cursor_y+1*scale,scale,scale,0,c_black,0.3);
draw_sprite_ext(sprite_index,image_index,cursor_x,cursor_y,scale,scale,0,c_white,1);