apply_damage(self,other.damage,other);

flash = 5;

var spray_direction = other.dir // from attacker to this enemy
//spray_direction = (spray_direction + 180) mod 360;

vfx_create_blood_spray(x, y, spray_direction, 20, true);

instance_destroy(other);