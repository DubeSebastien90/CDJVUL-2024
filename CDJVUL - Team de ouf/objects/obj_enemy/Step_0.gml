if hp <= 0 {
	instance_destroy()
}

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
		ennemy_anim()
	break
	case states.DEAD:
		ennemy_anim()
	break
}
if hit_cooldown > 0 {hit_cooldown -= 1}

var _inst = instance_place(x, y, obj_enemy);
if (_inst != noone) {
	var _diff_x = x - _inst.x;
	var _diff_y = y - _inst.y;
	x += (_diff_x / 128);
	y += (_diff_y / 128);
}

depth = -bbox_bottom