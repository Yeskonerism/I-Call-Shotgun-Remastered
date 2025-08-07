map_generated = false;

if(!audio_is_playing(snd_music_unnamed)) {
	//audio_play_on_channel( 0, snd_music_unnamed, true, "music" );	
}

// Create grid
var cell_w = 8;
var cell_h = 8;

var h_cells = room_width div cell_w;
var v_cells = room_height div cell_h;

global.grid = mp_grid_create(0,0,h_cells,v_cells,cell_w,cell_h);