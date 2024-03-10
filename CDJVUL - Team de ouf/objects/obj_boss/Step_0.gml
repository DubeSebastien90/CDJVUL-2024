depth = -bbox_bottom

if obj_legs.bossStart == true{
	cooldownAttack -= 1
}

if active = false && cooldownAttack < 0{
	active = true
	obj_legs.control = true
}

if active{
	//code va ici
}

if hp <= 0 {
	instance_destroy()
}