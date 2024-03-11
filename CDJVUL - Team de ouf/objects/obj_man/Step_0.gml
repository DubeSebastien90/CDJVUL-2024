//mort
if hp <= 0 && obj_boss.mort = false{
	image_index = 1
	obj_legs.control = false
	mort = true
}

//variables
mouse_down = mouse_check_button(mb_left) && canAttack && obj_legs.control
mouse_pressed = mouse_check_button_pressed(mb_left) && canAttack && obj_legs.control
press_left = keyboard_check(ord("A")) && obj_legs.control
press_right =  keyboard_check(ord("D")) && obj_legs.control
press_up = keyboard_check(ord("W")) && obj_legs.control
press_down = keyboard_check(ord("S")) && obj_legs.control
press_something = (press_up||press_down||press_right||press_left)  && obj_legs.control

cote = sign(mouse_x-x) 

if !mort{
dir = point_direction(x,y-8,mouse_x,mouse_y)
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
		obj_epe.attacking = false
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
		obj_epe.attacking = true
		obj_son.play_sound(snd_sword,0.1)
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
	weaponX = dcos(dirTrue)*arcReach + x
	weaponY = -dsin(dirTrue)*arcReach + y - 9
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
			spd = (moi.bowState - 0.5)*1.2
			dmg = moi.dmgBow[moi.bowState]
		}
		obj_son.play_sound(snd_arrow,0.1)
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
} else if weapon == 2{
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
	if viser = true{
		rot = dir
		weaponX = dcos(dirTrue)*boomerangReach + x
		weaponY = -dsin(dirTrue)*boomerangReach + y - 9
	} else{
		rot += 10
		spdBoom -= spdDecrease
		if spdBoom < 0 && reviens = false{
			reviens = true
			spdDecrease *= -1
		}
		if reviens = true{
			dirThrow = point_direction(weaponX,weaponY,x,y-9)
			if point_distance(x,y-9,obj_boomerang.x,obj_boomerang.y) < 5{
				viser = true
				_boomeranReach = 15
				boomerangReach = 0
				obj_boomerang.x = x 
				obj_boomerang.y = y-9
				obj_boomerang.thrown = false
				with(obj_son){
					audio_stop_sound(snd_boomerang)
				}
			}
		}
		weaponX += dcos(dirThrow)*spdBoom
		weaponY += -dsin(dirThrow)*spdBoom
	}

	
	if mouse_pressed && viser = true{
		viser = false
		reviens = false
		spdBoom = spdInitiale
		dirThrow = dir
		spdDecrease = _spdDecrease
		_boomerangReach = 0
		obj_boomerang.thrown = true
		obj_son.play_sound_normal(snd_boomerang)
	}
	
	boomerangReach = lerp(boomerangReach,_boomeranReach,0.1)
	obj_boomerang.image_angle = rot
	obj_boomerang.x = weaponX
	obj_boomerang.y = weaponY
} else if weapon == 3{
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
	weaponX = dcos(dirTrue)*bombReach + x
	weaponY = -dsin(dirTrue)*bombReach + y - 9
	
	if cooldownRechargeBomb == 0 && lanceBombe = true{
		lanceBombe = false
		instance_create_depth(x,y,depth-1,obj_bomb)
	}
	
	if lanceBombe = false{
		if instance_exists(obj_bomb){
			obj_bomb.x = weaponX
			obj_bomb.y = weaponY
		}
	}
	
	if mouse_pressed && lanceBombe = false{
		lanceBombe = true
		obj_bomb.lance = true
		obj_bomb.dir = dir
	}
	
	
	cooldownRechargeBomb -= 1
}