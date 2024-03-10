if thrown{
if hit_cooldown == 0 {
	other.hp -= 5
	with(instance_create_depth(x,y,-550,obj_textShow)){
		text = string(5)
	}
	hit_cooldown = 20
}
}
