function global_initialise(_debug){
	#macro CAMERA		view_camera[0]
	#macro CAMERA_W		camera_get_view_width(CAMERA)
	#macro CAMERA_H		camera_get_view_height(CAMERA)
	#macro CAMERA_X		camera_get_view_x(CAMERA)
	#macro CAMERA_Y		camera_get_view_y(CAMERA)
	
	global.debug = _debug;
	
	initialise_audio_manager(16);
	
	global.world_object_count = 0;
	global.entity_count = 0;
	global.vfx_count = 0;
	
	global.vfx_limit = 10000;
	
	global.paused = false;
}