//variables
mouse_down = mouse_check_button(mb_left) && canAttack
mouse_pressed = mouse_check_button_pressed(mb_left) && canAttack
dir = point_direction(x,y-8,mouse_x,mouse_y)
press_left = keyboard_check(ord("A"))
press_right =  keyboard_check(ord("D"))
press_up = keyboard_check(ord("W"))
press_down = keyboard_check(ord("S"))

cote = sign(mouse_x-x) 

if obj_legs.movementType == 4{
	mouse_down = keyboard_check(vk_space) && canAttack
	mouse_pressed = keyboard_check_pressed(vk_space) && canAttack
	dir = point_direction(0,0,press_right-press_left,press_down-press_up)
	cote = 1
	if dir > 90 && dir < 270{ 
		cote = -1
	}
}

//attaque
if weapon == 0{
	if animationSword{
		dirLock += 13
		if dirLock < 90 && dirTrue > 270{
			dirLock += 360
		}
		if dirLock > 270 && dirTrue < 90{
			dirLock -= 360
		}
		dirTrue = lerp(dirTrue,dirLock,0.2)
				if dirTrue > 360 && dirLock > 360{
			dirTrue -= 360
			dirLock -= 360
		}
		if dirTrue < 0 && dirLock < 0{
			dirTrue += 360
			dirLock += 360
		}
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
	if animationCooldown < 0{
		animationSword = false
	}
	weaponX = dcos(dirTrue)*swordReach + x
	weaponY = -dsin(dirTrue)*swordReach + y - 9
	if animationSword{
	_rot = dirLock + (dir-dirLock)/3 - 90
	} else{
		_rot = dir - 90
	}
	if _rot < 0{
		_rot += 360
	}
	if _rot >= 360{
		rot -= 360
	}
	if _rot < 90 && rot > 270{
		_rot += 360
	}
	if _rot > 270 && rot < 90{
		_rot -= 360
	}
	rot = lerp(rot,_rot,0.2)
	if rot > 360 && _rot > 360{
		rot -= 360
		_rot -= 360
	}
	if rot <= 0 && _rot <= 0{
		_rot += 360
		rot += 360
	}
	animationCooldown -= 1
	if mouse_pressed && animationSword = false && cooldownSword < 0{
		dirLock = dir - (dureeAtaque*8)
		animationSword = true
		animationCooldown = dureeAtaque
		cooldownSword = dureeAtaque + 30
	}
	cooldownSword -= 1
	obj_epe.x = weaponX
	obj_epe.y = weaponY
	obj_epe.image_angle = rot
} else if weapon == 1{
	//choisir direction
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
	weaponX = dcos(dirTrue)*swordReach + x
	weaponY = -dsin(dirTrue)*swordReach + y - 9
	rot = dir
	//tirer
	weaponIndex = bowState
	if mouse_down{
		if cooldownState< 0 {
			if bowState < 4 && bowState != 0{
				bowState += 1
			cooldownState = 40
			}
		}
	}
	cooldownState -= 1
	if bowState = 0{
	cooldownRecharge -= 1
	}
	if !mouse_down && bowState > 1{
		var moi = self
		with(instance_create_depth(weaponX,weaponY,depth-1,obj_arrow)){
			dir = moi.dir
			spd = (moi.bowState - 1.7)*1.6
		}
		bowState = 0
	}
	if cooldownRecharge < 0{
		bowState = 1
		cooldownRecharge = 60
	}
	
	obj_arc.image_angle = rot
	obj_arc.x = weaponX
	obj_arc.y = weaponY
	obj_arc.image_index = weaponIndex
}