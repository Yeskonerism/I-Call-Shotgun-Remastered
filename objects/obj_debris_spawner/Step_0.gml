if(!debris_spawned) {
	if(debris_object != noone) {
		for(var i = 0; i < amount; i++) {
			with(instance_create_layer(x,y,"VFXSub",obj_debris_glass_door))
				downscale = false;
				
			if(i == amount - 1) {
				debris_spawned = true;
			}	
		}

		
	}
}