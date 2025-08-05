function initialise_audio_manager(_channels) {
	global.audio_channels = [];

	for (var i = 0; i < _channels; i++) {
		var channel = {
			_id: i,
			sound: undefined,
			playing: false,
			volume: 1,
			tag: "",
		};
		array_push(global.audio_channels, channel);
	}
}

function audio_play_on_channel(_channel_id, _sound, _loop, _tag) {
	if (_channel_id < 0 || _channel_id >= array_length(global.audio_channels)) return;

	var chan = global.audio_channels[_channel_id];

	if (chan.playing) {
		audio_stop_sound(chan.sound);
	}

	var snd_instance = audio_play_sound(_sound, 1, _loop);

	global.audio_channels[_channel_id] = {
		id: _channel_id,
		sound: snd_instance,
		original_sound: _sound, // ← store the original sound asset
		playing: true,
		volume: 1,
		tag: _tag
	};
}


function audio_stop_channel(_channel_id) {
	if (_channel_id < 0 || _channel_id >= array_length(global.audio_channels)) return;
	var chan = global.audio_channels[_channel_id];

	if (chan.playing) {
		audio_stop_sound(chan.sound);
		chan.playing = false;
	}
}

function audio_stop_tag(_tag) {
	for (var i = 0; i < array_length(global.audio_channels); i++) {
		var chan = global.audio_channels[i];
		if (chan.playing && chan.tag == _tag) {
			audio_stop_sound(chan.sound);
			chan.playing = false;
		}
	}
}

function audio_set_channel_volume(_channel_id, _volume) {
	if (_channel_id < 0 || _channel_id >= array_length(global.audio_channels)) return;
	var chan = global.audio_channels[_channel_id];

	if (chan.playing) {
		audio_sound_gain(chan.sound, _volume, 0);
		chan.volume = _volume;
	}
}

function audio_find_sound_in_channel(_sound) {
	for (var i = 0; i < array_length(global.audio_channels); i++) {
		if (_sound == global.audio_channels[i].original_sound) {
			debug_stream_add("Sound: " + audio_get_name(_sound) + " was found in channel: " + string(i));
			return i;
		}
	}
	
	debug_stream_add("Could not find sound: " + audio_get_name(_sound));
	return -1;
}
