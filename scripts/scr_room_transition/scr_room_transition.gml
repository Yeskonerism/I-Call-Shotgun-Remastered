function room_fade_transition(_target_room, _executions = undefined) {
	var inst = instance_create_layer(0, 0, "Super", obj_fader);
	inst.target_room = _target_room;

	if(_executions != undefined) {
		inst.executions = _executions;	
	}
}