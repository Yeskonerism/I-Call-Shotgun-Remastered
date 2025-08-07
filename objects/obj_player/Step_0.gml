#region Player Movement

// player keys
var key_left = keyboard_check(ord("A")); 
var key_right = keyboard_check(ord("D"));  
var key_up = keyboard_check(ord("W")); 
var key_down = keyboard_check(ord("S")); 

var key_dash = keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_side1);

// movement calculation
if(can_move) {
	hsp = key_right - key_left;
	vsp = key_down - key_up;

	// horizontal collision
	if(!place_free(x + hsp, y)) {
		hsp = 0;
	}

	x += hsp;

	// vertical collision
	if(!place_free(x, y + vsp)) {
		vsp = 0;
	}

	y += vsp;

	// dash mechanic
	if(dash_value > 100) can_dash = true;
	else can_dash = false;

	dashes = floor(dash_value/100); // debugging

	if(dash_value < dash_value_reset) {
		dash_value++;
	}

	if (key_dash) {
	    player_dash(hsp,vsp);
	}
}

#endregion

#region Player Animation

if(abs(hsp) > 0 || abs(vsp) > 0) {
	sprite_index = spr_player_run;	
} else sprite_index = spr_player;

if(abs(hsp) > 0) {
	draw_angle = lerp(draw_angle, 5 * -hsp, 0.1);	
} else {
	draw_angle = lerp(draw_angle, 0, 0.1);	
}

if(mouse_x < x) draw_xscale = -1;
else draw_xscale = 1;

#endregion

#region Gameplay loop (hp)

if(health_points > max_health_points) health_points = max_health_points;

#endregion

// debugging
// saving
if(keyboard_check_pressed(vk_f9)) {
	save_game_state();	
}

if(keyboard_check_pressed(vk_f10)) {
	load_game_state();	
}

if(keyboard_check_pressed(ord("F"))) {
	vfx_create_sparks(x,y,50,true,{
		sprite: spr_vfx_spark,
		color: c_yellow,
		alpha_start: 1,
		alpha_end: 0,
		scale_x: 0.5 + random_range(0,0.5),
		scale_y: 0.5 + random_range(0,0.5),
		angle: random(360)
	});
}