enum Entity {
	player,
	base_enemy
}

function entity_spawn(_type,_pos_x,_pos_y,_layer,_options = {}){
	switch(_type) {
	case Entity.player:	
		instance_create_layer(_pos_x,_pos_y,_layer,obj_player);
		break;
	case Entity.base_enemy:	
		instance_create_layer(_pos_x,_pos_y,_layer,obj_enemy_base);
		break;
	}
}