function damage_enemy(_tid, _sid, _dmg, _time){
	with(_tid) {
		hp -= _dmg
		var _dead = is_dead()
		path_end()
		if _dead {var dis = 4} else {var _dis = 1}
		var _dir = point_direction(_sid.x, _sid.y, x, y)
		x += lengthdir_x(_dis, _dir)
		y += lengthdir_y(_dis, _dir)
		calc_path_delay = _time
		alert = true
		knockback_time = _time
		return dead
	}
}

function is_dead(){
	if state != states.DEAD {
		if hp <= 0 {
			state = states.DEAD
			hp = 0
			image_index = 0
			switch(object_index) {
				default:
					//default death sound
				break
				case obj_enemy:
					//death sound
				break
			}
			return true
		}
	}
	else {return true}
}