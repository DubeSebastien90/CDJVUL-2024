//y = prevY
//prevY = y
if spd < 0{
	if !place_meeting(x,y,obj_can_land){
		mort = true
		depth = 25
	}
	if !mort{
		spd = 0
		vspd = 0
		rotChange = 0
		frct = 0
	} else{
		image_alpha = lerp(image_alpha,0,0.1)
	}
	image_speed = 1
} else {
	if lance{
		spd -= frct
		z -= vspd
		x += dcos(dir) * spd
		y += (-dsin(dir) * spd)
		rot += rotChange*spd
		depth = -bbox_bottom
	} else{
		depth = obj_man.depth - 2
	}
}

