if(!instance_exists(obj_cursor)) {
	instance_create_layer(0,0,"UserInterface",obj_cursor);
}

if(!instance_exists(obj_camera)) {
	instance_create_layer(0,0,"Game",obj_camera);	
}

if(!instance_exists(obj_user_interface)) {
	instance_create_layer(0,0,"UserInterface",obj_user_interface);	
}

if(!instance_exists(obj_fog_controller)) {
	instance_create_layer(0,0,"UserInterface",obj_fog_controller);	
}

// automatic tilemap based solid generation
if(!map_generated) {
	var looper_x;
	var looper_y;
	
	var tileset = layer_tilemap_get_id("Walls");
	var tile_width = 16;
	
	var tile_id;
	
	for(looper_y = 0; looper_y < room_height; looper_y+=tile_width) {
		for(looper_x = 0; looper_x < room_width; looper_x+=tile_width) {
			tile_id = tilemap_get_at_pixel(tileset,looper_x,looper_y);
		
			if(tile_id != 0 && tile_id <= 55) {
				instance_create_layer(looper_x,looper_y,"Solids",obj_solid);
			}
		}	
	}
	
	if(looper_x >= room_width-tile_width && looper_y >= room_height-tile_width)
		map_generated = true;
}

mp_grid_clear_all(global.grid);

mp_grid_add_instances(global.grid, obj_solid, false);

//for(var i = 0; i < instance_number(objParentDoor); i++) {
//	if(!instance_find(objParentDoor,i).isOpenable)
//		mp_grid_add_instances(global.grid, instance_find(objParentDoor,i).id, false);
//}