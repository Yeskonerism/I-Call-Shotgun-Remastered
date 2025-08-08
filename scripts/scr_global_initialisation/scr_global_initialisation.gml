function global_initialise(_debug){
	// camera macros
	#macro CAMERA		view_camera[0]
	#macro CAMERA_W		camera_get_view_width(CAMERA)
	#macro CAMERA_H		camera_get_view_height(CAMERA)
	#macro CAMERA_X		camera_get_view_x(CAMERA)
	#macro CAMERA_Y		camera_get_view_y(CAMERA)
	
	#macro TILE_SIZE	16
	
	// debug
	global.debug = _debug;
	
	// audio
	initialise_audio_manager(16);
	
	// object limits + count
	global.world_object_count = 0;
	global.entity_count = 0;
	global.vfx_count = 0;
	global.decal_count = 0;
	
	global.entity_limit = 150;
	global.vfx_limit = 10000;
	global.decal_limit = 10000;
	
	// game state
	global.paused = false;
}