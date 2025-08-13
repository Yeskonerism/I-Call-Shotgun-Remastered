dialouge_trigger = true;

trigger_function = function () {
	with(instance_create_layer(0,0,"UserInterface",obj_dialouge_box)) {
		font = fnt_user_interface;
		
		text = "You can use SPACE to destroy some objects";
		
		auto_close = false;
		
		close_on_key = true;
		close_key = vk_space;
		
		close_on_mouse = true;
		close_mouse = mb_side1;
	}
		
	instance_destroy(inst_6AA96053);
};