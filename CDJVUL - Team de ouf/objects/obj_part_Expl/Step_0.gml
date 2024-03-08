if vspd > 0{
	image_alpha = lerp(image_alpha,0,0.1)
	if image_alpha < 0.1{
		instance_destroy()
	}
}

if speed > 0{
	speed -= 0.1
} else speed = 0

vspd += grav
y += vspd
x += hspd


