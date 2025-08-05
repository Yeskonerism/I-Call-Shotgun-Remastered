#macro FILE_LOCATION "i-call-shotgun-settings.ini"

/// @desc save the current state of the game
function save_game_state(){
	ini_open(FILE_LOCATION);
		ini_write_real("player","location x",obj_player.x);
		ini_write_real("player","location y",obj_player.y);
		
		ini_write_real("player","dash", obj_player.dash_value);
	
		ini_write_real("screens","current screen",room.id);
	ini_close();
}

function load_game_state() {
	ini_open(FILE_LOCATION);
		obj_player.x = ini_read_real("player","location x", 0);
		obj_player.y = ini_read_real("player","location y", 0);
		
		obj_player.dash_value = ini_read_real("player","dash", 0);
		
		//room = ini_read_real("screens","current screen",0); errors?
	ini_close();
}

function save_value() {
	
}

function load_value() {
	
}