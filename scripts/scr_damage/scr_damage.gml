function apply_damage(_target, _amount, _source = undefined){
	if(instance_exists(_target)) {
		// todo target check for player - add got hit feedback
			
		_target.health_points -= _amount;	
	}
}