if cooldownVie < 0{
	image_alpha = lerp(image_alpha,0,0.02)
	if image_alpha < 0.05{
		instance_destroy()
	}
}
image_angle += rotSpd
cooldownVie -= 1