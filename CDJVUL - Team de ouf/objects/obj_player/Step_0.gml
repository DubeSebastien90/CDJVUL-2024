//variables
press_left = keyboard_check(ord("A"))
press_right =  keyboard_check(ord("D"))
press_up = keyboard_check(ord("W"))
press_down = keyboard_check(ord("S"))
press_space_pressed = keyboard_check_pressed(vk_space)
press_space =  keyboard_check(vk_space)

//mouvement
var moveX = 0
var moveY = 0

if movementType == 0{
	actualWalkspd = walkspd_crab
	//crabe
	if press_space_pressed{
		//changer d'axe
		axis += 1
		if axis > 1{
			axis = 0
		}
	}
	//mouvement selon l'axe
	if axis == 0{
		moveX = press_right - press_left
	} else {
		moveY = press_down - press_up
	}
} else if movementType == 1{
	//bélier
	if dashDurationCooldown <= 0{
		//bouger normalement
		moveX = press_right - press_left
		moveY = press_down - press_up
		actualWalkspd = walkspd_belier
		alpha = 1
	} else {
		moveX = dashX
		moveY = dashY
		actualWalkspd = walkspd_dashBelier
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
}

if control{
	//diagonale
	var diff = sqrt(power(moveX,2) + power(moveY,2))
	if diff != 0{
		diff = 1/diff
	}
	
	hspd = moveX*actualWalkspd*diff
	vspd = moveY*actualWalkspd*diff
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
}
if place_meeting(x,y+vspd,obj_collision){
	while!place_meeting(x,y+sign(vspd),obj_collision){
		y += sign(vspd)
	}
	vspd = 0
}
if place_meeting(x+hspd,y+vspd,obj_collision){
	hspd = 0
	vspd = 0
}

x += hspd
y += vspd