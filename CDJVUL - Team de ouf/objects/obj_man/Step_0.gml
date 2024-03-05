//variables
mouse_down = mouse_check_button(mb_left)
mouse_pressed = mouse_check_button_pressed(mb_left)
dir = point_direction(x,y-8,mouse_x,mouse_y)
press_left = keyboard_check(ord("A"))
press_right =  keyboard_check(ord("D"))
press_up = keyboard_check(ord("W"))
press_down = keyboard_check(ord("S"))

cote = sign(mouse_x-x) 

if obj_legs.movementType == 4{
	mouse_down = keyboard_check(vk_space)
	mouse_pressed = keyboard_check_pressed(vk_space)
	dir = point_direction(0,0,press_right-press_left,press_down-press_up)
	cote = 1
	if dir > 90 && dir < 270{ 
		cote = -1
	}
}

//attaque
if weapon == 0{
	if animationSword{
		dirTrue = lerp(dirTrue,dirLock,0.1)
		swordReach = lerp(swordReach,swordReachMax,0.1)
	} else{
		if dir < 90 && dirTrue > 270{
			dir += 360
		}
		if dir > 270 && dirTrue < 90{
			dir -= 360
		}
		dirTrue = lerp(dirTrue,dir,0.1)
		if dirTrue > 360 && dir > 360{
			dirTrue -= 360
			dir -= 360
		}
		if dirTrue < 0 && dir < 0{
			dirTrue += 360
			dir += 360
		}
		swordReach = lerp(swordReach,swordReachMin,0.1)
	}
	weaponX = dcos(dirTrue)*swordReach + x
	weaponY = -dsin(dirTrue)*swordReach + y - 9
	rot = dir - 90
	if mouse_pressed{
		dirLock = dir
		animationSword = true
	}
}