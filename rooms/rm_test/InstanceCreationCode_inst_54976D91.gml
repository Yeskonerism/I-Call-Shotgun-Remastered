dialouge_trigger = true;

trigger_function = function () {
	var d_box = instance_create_layer(0,0,"UserInterface",obj_dialouge_box);
		d_box.font = fnt_user_interface;
		
		d_box.text = "Use E while near a console to activate it";
		
		d_box.auto_close = false;
		
		d_box.close_on_key = false;

		d_box.end_on_event = true;
		d_box.end_event = function() {
			return obj_console.is_activated;
		}
};