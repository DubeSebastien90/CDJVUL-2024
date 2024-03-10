if !onGround {
	instance_destroy()
	other.hp -= dmg
	var _dmg = dmg
	with(instance_create_depth(x,y,-550,obj_textShow)){
		text = string(_dmg)
	}
}
