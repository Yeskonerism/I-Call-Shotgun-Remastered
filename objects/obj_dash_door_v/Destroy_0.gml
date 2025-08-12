vfx_create_explosion_small(x,y,true);

for(var i = 0; i < irandom_range(24,36); i++)
	instance_create_layer(x,y,"VFXSub",obj_debris_dash_door);

audio_play_on_channel(13,snd_enemy_death,false,"doors");