depth = obj_legs.depth - 1 - 16

if attacking{
	with(obj_enemy_par){
		if place_meeting(x,y,obj_epe){
			if collisionSword = false{
				hp -= obj_epe.dmgEpe
				with(instance_create_depth(x,y,-550,obj_textShow)){
					text = string(obj_epe.dmgEpe)
				}
			}
			collisionSword = true
		}
	}
} else{
	with(obj_enemy_par){
		collisionSword = false
	}
}