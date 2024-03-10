if thrown{
if other.hit_cooldown < 0 {
	other.hp -= dommage
	with(instance_create_depth(x,y,-550,obj_textShow)){
		text = string(obj_boomerang.dommage)
	}
	other.hit_cooldown = 20
}
}
