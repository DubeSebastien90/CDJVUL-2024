//variables
press_left = keyboard_check(ord("A"))
press_right =  keyboard_check(ord("D"))
press_up = keyboard_check(ord("W"))
press_down = keyboard_check(ord("S"))
press_space_pressed = keyboard_check_pressed(vk_space)
press_space =  keyboard_check(vk_space)
mouse_down = mouse_check_button(mb_left)

//press_something = press_up||press_down||press_right||press_left

//mouvement
var moveX = 0
var moveY = 0

if movementType == 0{
	lerpVal = lerpCrab
	actualWalkspd = walkspd_crab
	//crabe
	if press_space_pressed && z = 0{
		//changer d'axe
		axis += 1
		if axis > 1{
			axis = 0
		}
		zspd = 1.3
	}
	zspd -= gravCrabe
	z += zspd
	if z < 0{
		z = 0
	}
	//mouvement selon l'axe
	if z = 0{
		if axis == 0{
			moveX = press_right - press_left
		} else {
			moveY = press_down - press_up
		}
	}
	if moveY!=0||moveX!=0||z!=0{
		if z !=0{
			cooldownCrabe -= 1
		}
		cooldownCrabe -= 1
		rot = lerp(rot,dsin(cooldownCrabe*18)*10,0.1)
		obj_man.manRot = rot
	} else{
		cooldownCrabe = 0
		rot = lerp(rot,0,0.1)
	}
	if cooldownCrabe < 0{
		imageIndex += 1
		imageIndex = imageIndex%2
		if axis == 1{
			imageIndex += 2
		}
		cooldownCrabe = 20
	}
} else if movementType == 1{
	//bélier
	lerpVal = lerpBelier
	if dashDurationCooldown <= 0{
		//bouger normalement
		moveX = press_right - press_left
		moveY = press_down - press_up
		actualWalkspd = walkspd_belier
		alpha = 1
		obj_man.canAttack = true
	} else {
		moveX = dashX
		moveY = dashY
		actualWalkspd = walkspd_dashBelier
		obj_man.canAttack = false
	}
	if press_space_pressed && dashCooldown <= 0{
		dashDurationCooldown = dashDuration
		dashCooldown = dashCooldownMax
		dashX = press_right - press_left
		dashY = press_down - press_up
		alpha = 0.6
	}
	dashCooldown -= 1
	dashDurationCooldown -= 1
	//animation
	if moveX!= 0{
		xscale = sign(moveX)
		obj_man.xscale = -xscale
	}
	if moveY!=0||moveX!=0{
		cooldownCrabe -= 1
	}
	if cooldownCrabe < 0{
		imageIndex += 1
		imageIndex = imageIndex%2
		cooldownCrabe = 20
	}
} else if movementType == 2{
	lerpVal = lerpFish
	//poisson
	if z <= 0{
		//sauter
		zspd = 0.6 + random_range(-0.03,0.03)
		z = 0.01
		dirX = (press_right - press_left)
		dirY = (press_down - press_up)
		
		dir = point_direction(0,0,dirX,dirY)
		if dirX = 0 && dirY = 0{
			dir = random_range(0,360)
			diffSpd = random_range(-0.20,0.20)
		} else{
			dir += random_range(-10,10)
			diffSpd = random_range(-0.05,0.05) + walkspd_fish
		}
	}
	actualWalkspd = diffSpd
	moveX = dcos(dir)
	moveY = -dsin(dir)
	zspd -= grav
	
	//collision avec le sol
	if z+zspd <= 0{
		zspd = 0
		z = 0
	}
	z += zspd
	//animation
	xscale = 1 + (zspd/5)
	yscale = 2-xscale
	if hspd!= 0{
		xscale *= sign(hspd)
	}
	obj_man.xscale = -xscale
	obj_man.yscale = yscale
	
} else if movementType = 3{
	//snake
	moveX = prevXSnake
	moveY = prevYSnake
	lerpVal = lerpSnake
	if cooldownMoveSnake <= 0{
		xfin = 0
		yfin = 0
		moveX = 0
		moveY = 0
		//bouger
		//if !(prevY[0] = y && prevX[0] = x){
			for(var i = length - 1; i > 0; i--){			
				prevX[i] = prevX[i-1]
				prevY[i] = prevY[i-1]
				snakePiece[i].x = prevX[i] 
				snakePiece[i].y = prevY[i]
				//snakePiece[i].index = index[i]
			}
		//}
		prevX[0] = x
		prevY[0] = y
		snakePiece[0].depth = -y+8
		//snakePiece[length].depth = -y-9
		snakePiece[0].x = x 
		snakePiece[0].y = y
		moveX = press_right - press_left
		if moveX == 0{
			moveY = press_down - press_up
		}
		prevXSnake = moveX
		prevYSnake = moveY
		for(var i = 0; i < length; i++){
			if prevX[i] == prevX[0]+tileSize*prevXSnake && prevY[i] == prevY[0]+tileSize*prevYSnake{
				moveX = 0
				moveY = 0
				press_something = false
				prevXSnake = 0
				prevYSnake = 0
			}
		}
		actualWalkspd = 1
		//if press_something{
			cooldownMoveSnake = cooldownMoveMaxSnake
		//}
		
		xFinDir = sign(prevX[length-1]-prevX[length-2])
		yFinDir = sign(prevY[length-1]-prevY[length-2])
	}
	for(var i = length; i > 0 ;i--){
		snakePiece[i].index = getIndexSerpent(i)
	}
	xfin -= xFinDir
	yfin -= yFinDir
	cooldownMoveSnake -= 1
} else if movementType == 4{
	//taupe
	if mouse_down{
		imageIndex = 0
		dirTaupe = point_direction(x,y,mouse_x,mouse_y)
		actualWalkspd = walkspd_taupe
		moveX = dcos(dirTaupe)
		moveY = -dsin(dirTaupe)
		if cooldownPartDirt < 0{
			cooldownPartDirt = 2
			if point_distance(x,y,mouse_x,mouse_y) > 5{
				instance_create_depth(x+random_range(-6,6),y+random_range(-6,6)+2,2,obj_part_dirt)
			}
		}
		cooldownPartDirt -= 1
		if z != -7{
			lerpVal = lerpTaupe
			z = -7
			repeat(10){
				instance_create_depth(x,y,obj_man.depth - 20,obj_part_Expl)
			}
		}
		obj_man.canAttack = false
	} else {
		imageIndex = 1
		cooldownPartDirt = 0
		lerpVal = 0.3
		if z != 0{
			z = 0
			repeat(10){
				instance_create_depth(x,y,depth - 20,obj_part_Expl)
			}
		}
		obj_man.canAttack = true
	}
}

if control{
	//diagonale
	diff = sqrt(power(moveX,2) + power(moveY,2))
	if diff = 0{
		diff = 1
	}
	
	hspd = lerp(hspd,moveX*actualWalkspd/diff,lerpVal)
	vspd = lerp(vspd,moveY*actualWalkspd/diff,lerpVal)
} else{
	hspd = 0
	vspd = 0
}


//collisions
if place_meeting(x+hspd,y,obj_collision){
	while!place_meeting(x+sign(hspd),y,obj_collision){
		x += sign(hspd)
	}
	hspd = 0
	//cooldownMoveSnake = 0
}
if place_meeting(x,y+vspd,obj_collision){
	while!place_meeting(x,y+sign(vspd),obj_collision){
		y += sign(vspd)
	}
	vspd = 0
	//cooldownMoveSnake = 0
}
if place_meeting(x+hspd,y+vspd,obj_collision){
	hspd = 0
	vspd = 0
}

x += hspd
y += vspd

obj_man.x = x 
obj_man.y = y - 4 - z 

//depth
depth = -bbox_bottom - z
obj_man.depth = depth + 1