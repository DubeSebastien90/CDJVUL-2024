
if z < 0{
	if !place_meeting(x,y,obj_can_land){
		mort = true
		depth = 25
	}
	if !mort{
		spd = 0
		vspd = 0
		image_alpha = lerp(image_alpha,0,0.01)
	} else {
		image_alpha = lerp(image_alpha,0,0.1)
	}
	if image_alpha< 0.05{
		instance_destroy()
	}
} else {
	image_angle = point_direction(0,0,dcos(dir),-dsin(dir))
	vspd += grav
	z -= vspd
}

x += dcos(dir) * spd
y += (-dsin(dir) * spd)

depth = -bbox_bottom