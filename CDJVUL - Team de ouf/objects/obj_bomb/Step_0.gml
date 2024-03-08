//y = prevY
//prevY = y
if mort || spd < 0{
	spd = 0
	vspd = 0
	image_speed = 1
	mort = true
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

