if hp <= 0 {
	if !mort{
		xMort = x 
		yMort = y
		obj_game.nb_ennemies -= 1
		path_delete(path)
	}
	x = xMort
	y = yMort
	mort = true
	state = states.DEAD
	sprite_index = spr_dead
	//instance_destroy()
}

if !mort{
switch(state) {
	case states.IDLE:
		check_for_player()
		if path_index != -1 {state = states.MOVE}
		ennemy_anim()
	break
		case states.APPROACHING:
		check_for_player()
		check_facing()
		if path_index == -1 {state = states.IDLE}
		ennemy_anim()
	break
	case states.MOVE:
		check_for_player()
		check_facing()
		if path_index == -1 {state = states.IDLE}
		ennemy_anim()
	break
	case states.ATTACK:
		with(instance_create_depth(x,y,depth,obj_eclair)){
			dir = point_direction(x,y,obj_man.x,obj_man.y-8)
			spd = 1
			image_xscale = 0.3
			image_yscale = 0.3
		}
	break
	case states.DEAD:
		ennemy_anim()
	break
}
}
if hit_cooldown > 0 {hit_cooldown -= 1}

if distance_to_object(obj_man) < atk_dis{
	if cooldownAttaque < 0 && state != states.DEAD{
	with(instance_create_depth(x,y,depth,obj_eclair)){
		dir = point_direction(x,y,obj_man.x,obj_man.y-8)
		spd = 1
		image_xscale = 0.5
		image_yscale = 0.5
		dammage = 5
	}
	cooldownAttaque = cooldownMax
	}
	cooldownAttaque -= 1
}


var _inst = instance_place(x, y, obj_enemy);
if (_inst != noone) {
	var _diff_x = x - _inst.x;
	var _diff_y = y - _inst.y;
	x += (_diff_x / 128);
	y += (_diff_y / 128);
}

depth = -bbox_bottom