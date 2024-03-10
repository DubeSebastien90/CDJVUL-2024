open = true
nbFrames = 7
myCollision = noone
image_index = 0
image_speed = 0

function createCollision(){
	myCollision = instance_create_layer(x,y,"collision",obj_collision)
	myCollision.image_xscale = 0.5
	myCollision.image_yscale = 3
}

function destroyCollision(){
	with(myCollision){
		instance_destroy()
	}
}