// Inherit the parent event
event_inherited();

if(state == "checking out" || state == "going back") {
	sprite_index = spr_enemy_walker_run;	
} else sprite_index = spr_enemy_walker;