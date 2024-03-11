//util
if keyboard_check_pressed(vk_tab){
	window_set_fullscreen(!window_get_fullscreen())
}

if keyboard_check_pressed(vk_escape){
	if animation = true{
	animation = false
	obj_legs.control = true
	}
}

//if  obj_boss.mort == true || obj_man.mort == true{
	if keyboard_check_released(ord("R")){
		game_restart()
	}	
//}

if obj_legs.x > 416 && waveState = 0{
	waveState = 1
	with(obj_door){
		if doorId == 0 || doorId == 1{
			open = false
		}
	}
}

if nb_ennemies <= 0 && waveState = 1{
	waveState = 2
	with(obj_door){
		if doorId == 1{
			open = true
		}
	}
}

if animation == true{
if cooldownEvent < 0{
	stage += 1
	cooldownEvent = cooldownEventMax
	if stage >= nbStages{
		animation = false
		obj_legs.control = true
	}
}
cooldownEvent -= 1
}