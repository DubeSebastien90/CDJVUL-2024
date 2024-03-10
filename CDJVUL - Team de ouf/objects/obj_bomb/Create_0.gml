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
	if !mort{
		screenShake(3,10)
		
		var moi = self
		with obj_enemy_par {
			if distance_to_object(moi) <= 25 {
				hp -= round((1 - (distance_to_object(moi) / 25)) * 60)
			}
		}
		with obj_man {
			if distance_to_object(moi) <= 10 {
				hp -= 15
			}
		}
	}
	instance_destroy()
	obj_man.cooldownRechargeBomb = 30
}

rotChange = random_range(4,8) * choose(-1,1)
rot = 0
frct = 0.05