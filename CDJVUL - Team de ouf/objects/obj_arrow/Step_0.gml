
if z < 0  || mort{
	spd = 0
	vspd = 0
	image_alpha = lerp(image_alpha,0,0.01)
	if image_alpha< 0.05{
		instance_destroy()
	}
} else {
	image_angle = point_direction(0,0,dcos(dir)*spd,(-dsin(dir)*spd)+vspd)
	vspd += grav
	z -= vspd
}

x += dcos(dir) * spd
y += (-dsin(dir) * spd) + vspd

depth = -bbox_bottom - z