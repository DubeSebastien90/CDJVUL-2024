if cooldownVie < 0{
	image_xscale = lerp(image_xscale,0,0.02)
	image_yscale = image_xscale
	if image_xscale < 0.5{
		image_alpha = lerp(image_alpha,0,0.1)
		if image_alpha < 0.1{
			instance_destroy()
		}
	}
}

cooldownVie -= 1