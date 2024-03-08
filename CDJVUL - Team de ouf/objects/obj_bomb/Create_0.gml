dir = 0
spd = 2.5
vspd = -2
grav = 0.1
image_speed = 0

z = 0
mort = false
prevY = y
lance = false

function explosion(){
	screenShake(3,10)
	instance_destroy()
	obj_man.cooldownRechargeBomb = 30
}

rotChange = random_range(4,8) * choose(-1,1)
rot = 0
frct = 0.05