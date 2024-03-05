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
	weaponX = dcos(dir)*swordReach + x
	weaponY = -dsin(dir)*swordReach + y - 10
	rot = dir - 90
}