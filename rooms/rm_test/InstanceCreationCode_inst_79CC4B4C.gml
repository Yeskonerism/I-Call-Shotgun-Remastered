dialouge_trigger = true;

trigger_function = function () {
	var d_box = instance_create_layer(0,0,"UserInterface",obj_dialouge_box);
		d_box.font = fnt_user_interface;
		
		d_box.text = "Use [WASD] to move";
		
		d_box.auto_close = false;
		d_box.close_on_key = true;
		d_box.close_key = ord("W");
};