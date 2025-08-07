menu_play = function() {
	room_fade_transition(rm_test);
}

menu_exit = function() {
	game_end(0);
}

menu = menu_create(["play","exit"],[menu_play,menu_exit]);