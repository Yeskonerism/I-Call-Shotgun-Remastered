// general "got hit" function
flash = 5;

audio_play_on_channel(10,choose(snd_enemy_hit,snd_enemy_hit_2),false,"enemy sfx");

var spray_direction = draw_xscale // from attacker to this enemy
//spray_direction = (spray_direction + 180) mod 360;

vfx_create_blood_spray(x, y, spray_direction, 50, true);