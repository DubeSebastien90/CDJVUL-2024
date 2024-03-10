depth = 19


if open{
	if image_index == nbFrames{
		destroyCollision()
	}
	if image_index > 0{
	image_index -= 1
	}
} else{
	if image_index == 0{
		createCollision()
	}
	if image_index < nbFrames{
	image_index += 1
	}
}
