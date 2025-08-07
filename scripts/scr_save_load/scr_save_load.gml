#macro SAVE_PATH "i-call-shotgun-save.json"


/// @desc save the current state of the game
function save_game_state() {
	var save_data = {
		player: {
			x: obj_player.x,
			y: obj_player.y,
			dash: obj_player.dash_value,
			health: obj_player.health_points
		},
		game: {
			room: room_get_name(room)
		}
	};

	var json = json_stringify(save_data);
	var file = file_text_open_write(SAVE_PATH);
	file_text_write_string(file, json);
	file_text_close(file);
}


function load_game_state() {
	if (!file_exists(SAVE_PATH)) return;

	var file = file_text_open_read(SAVE_PATH);
	var json = file_text_read_string(file);
	file_text_close(file);

	var save_data = json_parse(json);

	if (is_struct(save_data)) {
		var p = save_data.player;
		obj_player.x = p.x;
		obj_player.y = p.y;
		obj_player.dash_value = p.dash;
		obj_player.health_points = p.health;

		// Optional: change room if different
		var room_name = save_data.game.room;
		if (room_name != room_get_name(room)) {
			room_goto(asset_get_index(room_name));
		}
	}
}


function save_value(section, key, value) {
	var data = file_exists(SAVE_PATH) ? json_parse(file_text_read(SAVE_PATH)) : {};
	if (!is_struct(data[? section])) data[? section] = {};
	data[section][key] = value;

	var json = json_stringify(data);
	var file = file_text_open_write(SAVE_PATH);
	file_text_write_string(file, json);
	file_text_close(file);
}


function load_value(section, key, default_val) {
	if (!file_exists(SAVE_PATH)) return default_val;

	var file = file_text_open_read(SAVE_PATH);
	var json = file_text_read_string(file);
	file_text_close(file);

	var data = json_parse(json);
	if (is_struct(data[? section])) {
		return data[section][? key] ?? default_val;
	}

	return default_val;
}
