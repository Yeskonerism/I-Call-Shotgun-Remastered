//enum VFX {
//	LargeExplosion,
//	SmallExplosion,
//	Sparks,
//	Dust,
//	Trail
//};

function vfx_create_trail(_x,_y,_sub_layer, _options = {}) {
	var inst = instance_create_layer(_x, _y, "VFXSub", obj_vfx_trail);
	
	if (inst != noone) {
		if (!is_undefined(_options.sprite)) inst.vfx_sprite = _options.sprite;
		if (!is_undefined(_options.color)) inst.vfx_color  = _options.color;
		if (!is_undefined(_options.alpha_start)) inst.vfx_alpha_start = _options.alpha_start;
		if (!is_undefined(_options.alpha_end)) inst.vfx_alpha_end = _options.alpha_end;
		if (!is_undefined(_options.scale_x)) inst.image_xscale = _options.scale_x;
		if (!is_undefined(_options.scale_y)) inst.image_yscale = _options.scale_y;
		if (!is_undefined(_options.angle)) inst.image_angle = _options.angle;
		if (!is_undefined(_options.lifetime)) inst.vfx_lifetime = _options.lifetime;
	}
}

function vfx_create_sparks(_x,_y, _spark_count, _sub_layer, _options = {}) {
	for (var i = 0; i < _spark_count; i++) {
		var inst = instance_create_layer(_x, _y, "VFXSub", obj_vfx_spark);
		if (inst != noone) {
			if (!is_undefined(_options.sprite)) inst.vfx_sprite = _options.sprite;
			if (!is_undefined(_options.color)) inst.vfx_color  = _options.color;
			if (!is_undefined(_options.alpha_start)) inst.vfx_alpha_start = _options.alpha_start;
			if (!is_undefined(_options.alpha_end)) inst.vfx_alpha_end = _options.alpha_end;
			if (!is_undefined(_options.scale_x)) inst.image_xscale = _options.scale_x;
			if (!is_undefined(_options.scale_y)) inst.image_yscale = _options.scale_y;
		}
	}
}
