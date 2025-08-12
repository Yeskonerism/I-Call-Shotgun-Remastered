trigger_function = function () {
	var d_box = instance_create_layer(0,0,"UserInterface",obj_dialouge_box);
		d_box.font = fnt_user_interface;
		
		d_box.text = "You can use SPACE to destroy some objects";
		
		d_box.auto_close = false;
		d_box.close_on_key = true;
		d_box.close_key = vk_space;
};

end_function = function() {
	instance_destroy(inst_79DD8229);
}