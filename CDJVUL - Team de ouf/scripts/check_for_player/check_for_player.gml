function check_for_player(){
	var _dis = distance_to_object(obj_man)
	//move_towards_point(obj_man.x, obj_man.y, speed)
	
	if (alert or (_dis <= alert_dis)) and _dis > atk_dis {
		alert =true
		
		if calc_path_timer-- <= 0 {
			//Reset timer
			calc_path_timer = calc_path_delay
		
			var _found_player = mp_grid_path(global.mp_grid, path, x, y, obj_man.x, obj_man.y, choose(0, 1))
	
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