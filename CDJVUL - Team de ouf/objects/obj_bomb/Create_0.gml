dir = 0
spd = 2.2
vspd = -2
grav = 0.1
image_speed = 0

z = 0
mort = false
prevY = y
lance = false

bombRadius = 25

function explosion(){
	if !mort{
		screenShake(3,10)
		obj_son.play_sound_low(snd_explosion)
		var moi = self
		with obj_enemy_par {
			if !mort{
			if distance_to_object(moi) <= obj_bomb.bombRadius {
				hp -= round((1 - (distance_to_object(moi) /  obj_bomb.bombRadius)) * 60)
				var _dmg =  round((1 - (distance_to_object(moi) /  obj_bomb.bombRadius)) * 60)
				with(instance_create_depth(x,y,-550,obj_textShow)){
					text = string(_dmg)
				}
			}
			}
		}
		with obj_man {
			if distance_to_object(moi) <= obj_bomb.bombRadius {
				hp -= round((1 - (distance_to_object(moi) /  obj_bomb.bombRadius)) * 60)
				var _dmg =  round((1 - (distance_to_object(moi) /  obj_bomb.bombRadius)) * 60)
				with(instance_create_depth(x,y-20,-550,obj_textShow)){
					text = string(_dmg)
					color = c_red
				}
			}
		}
	}
	instance_destroy()
	obj_man.cooldownRechargeBomb = 30
	for(var i = 0; i < 360;){
		instance_create_depth(x+dcos(i)*bombRadius*random_range(0.2,0.8),y-dsin(i)*bombRadius*random_range(0.2,0.8),depth,obj_part_wind)
		i += random_range(40,50)
	}
	for(var i = 0; i < 360;){
		instance_create_depth(x+dcos(i)*bombRadius,y-dsin(i)*bombRadius,depth,obj_part_wind)
		i += random_range(20,30)
	}
}

rotChange = random_range(4,8) * choose(-1,1)
rot = 0
frct = 0.05