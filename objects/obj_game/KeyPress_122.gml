if(!instance_exists(obj_debug_console)) {
	var console = instance_create_layer(0,0,"UserInterface",obj_debug_console);
	console.console_active = true;
} else instance_destroy(obj_debug_console);