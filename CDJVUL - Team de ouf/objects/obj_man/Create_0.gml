depth -= 1
canAttack = true

weapon = 0

//weapon 0 - sword
swordReachMin = 10
swordReachMax = 15
swordReach = swordReachMin
dir = 0
weaponX = x
weaponY = y
rot = 0
dirLock = 0
dirTrue = 0
animationSword = false
dureeAtaque = 25
animationCooldown = 0
if weapon == 0{
	instance_create_depth(x,y,depth,obj_epe)
}

//weapon 1 - arc
arcReach = 10