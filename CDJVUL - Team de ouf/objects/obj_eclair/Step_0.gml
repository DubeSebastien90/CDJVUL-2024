
x += dcos(dir)*spd
y -= dsin(dir)*spd

depth = -550

//despawn
if place_meeting(x,y,obj_collision){
	mort = true
}
if mort{
	image_alpha = lerp(image_alpha,0,0.05)
	if image_alpha < 0.1{
		instance_destroy()
	}
}

image_angle = dir + 20