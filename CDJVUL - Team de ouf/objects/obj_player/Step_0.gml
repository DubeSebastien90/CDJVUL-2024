press_left = keyboard_check(vk_left) || keyboard_check(ord("A"))
press_right = keyboard_check(vk_right) || keyboard_check(ord("D"))
press_up = keyboard_check(vk_up) || keyboard_check(ord("W"))
press_down = keyboard_check(vk_down) || keyboard_check(ord("S"))
press_space = keyboard_check_pressed(vk_space)

//mouvement
var moveX = press_right - press_left
var moveY = press_down - press_up



if control{
	hspd = moveX*walkspd
	vspd = moveY*walkspd
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