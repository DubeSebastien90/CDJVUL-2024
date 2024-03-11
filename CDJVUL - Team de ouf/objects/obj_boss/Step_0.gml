depth = -bbox_bottom
if depth > -10{
	depth = -10
}
visible = true
if obj_legs.bossStart == true{
	cooldownAttack -= 1
}

if active = false && cooldownAttack < 0{
	active = true
	obj_legs.control = true
	cooldownAttack = dureChargeAttaque
}

if active{
	//idle - 0, single - 1, multi - 2, charge - 3, mort - 4
	
	//charger les attaques
	if cooldownAttack < 0 && !mort{
		if attackPhase == 1{
			//single
			image_index = 0
			with(instance_create_depth(x,y,depth,obj_eclair)){
				spd = 3
				dammage = obj_boss.dmgEclairGros
				dir = point_direction(x,y,obj_man.x,obj_man.y-8)
				image_xscale = 1.5
				image_yscale = image_xscale
			}
			attackPhase = 0
			waitTime = waitBetween
		} else if attackPhase == 2{
			//multi
			image_index = 0
			var rangeDiff = random_range(0,45)
			for (var i = 0; i < 8; i++){
				with(instance_create_depth(x,y,depth,obj_eclair)){
					spd = 2
					dammage = obj_boss.dmgEclairPetit
					dir = obj_boss.dirEclair[i] + rangeDiff
					image_xscale = 1
					image_yscale = image_xscale
				}
			}
			attackPhase = 0
			waitTime = waitBetween
		} else if attackPhase == 3 && jump = false{
			//charge
			newDest = false
			image_index = 4
			jump = true
			vspd = -7
		}
	}
	
	//commencer l'attaque
	if waitTime < 0 && attackPhase == 0{
		attackRendu += 1
		if attackRendu > 3{
			attackRendu = 1
		}
		attackPhase = attackRendu
		cooldownAttack = dureChargeAttaque
		image_index = attackPhase
	}
	
	//cooldowns
	if attackPhase == 0{
		waitTime -= 1
	} else{
		cooldownAttack -= 1
	}
}

//mouvement
if jump = true{
	vspd += grav
	y += vspd
	if newDest = false && y < -20{
		newDest = true
		x = random_range(768,928)
		y_to = random_range(64,138)
	}
	
	if y + vspd > y_to{
		vspd = 0
		y = y_to
		jump = false
		attackPhase = 0
		waitTime = waitBetween
		image_index = 0
		screenShake(3,10)
		for(var i = 0; i < 360;){
			instance_create_depth(x+dcos(i)*radiusExpl*random_range(0.2,0.8),20+y-dsin(i)*radiusExpl*random_range(0.2,0.8),depth,obj_part_wind)
			i += random_range(40,50)
		}
		for(var i = 0; i < 360;){
			instance_create_depth(x+dcos(i)*radiusExpl,20+y-dsin(i)*radiusExpl,depth,obj_part_wind)
			i += random_range(20,30)
		}
		if instance_exists(obj_man){
			if distance_to_point(obj_man.x,obj_man.y-20-8) < radiusExpl && !obj_man.mort{
				var ouch = dmgExpl
				obj_man.hp -= ouch
				with(instance_create_depth(obj_man.x,obj_man.y-20,-550,obj_textShow)){
					text = string(ouch)
					color = c_red
				}
			}
		}
	}
}
xShadow = lerp(xShadow,x,0.1)
yShadow = lerp(yShadow,y_to,0.1)

if hp <= 0  && obj_man.mort = false{
	mortAnim()
}

//boomerang
hit_cooldown -= 1