depth = -bbox_bottom

if obj_legs.bossStart == true{
	cooldownAttack -= 1
}

if active = false && cooldownAttack < 0{
	active = true
	obj_legs.control = true
}