function check_facing(){
	var _facing = sign(x - xp)
	if _facing != 0 {facing = _facing}
}

function check_for_player(){
	var _dis = distance_to_object(obj_man)
	
	if (alert or (_dis <= alert_dis)) and _dis > atk_dis {
		alert =true
		
		if calc_path_timer-- <= 0 {
			//Reset timer
			calc_path_timer = calc_path_delay
			
			if x == xp and y == yp {var _type = 0} else {var _type = 1}
			var _found_player = mp_grid_path(global.mp_grid, path, x, y, obj_man.x, obj_man.y, _type)
	
			if _found_player {
				path_start(path, move_speed, path_action_stop, false)
			}
		}
	}
	else {
		if _dis <= atk_dis {
			path_end()
		}
	}
}

function ennemy_anim(){
	switch(state) {
		case states.IDLE:
			sprite_index = spr_idle
		break
		case states.MOVE:
			sprite_index = spr_move
		break
		case states.ATTACK:
			sprite_index = spr_attack
		break
		case states.DEAD:
			sprite_index = spr_dead
		break
	}
	xp = x
	yp = y
}