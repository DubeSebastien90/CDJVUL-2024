depth -= 1
canAttack = true

xscale = 1
yscale = 1
weaponIndex = 0

weapon = 2

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
cooldownSword = 0
if weapon == 0{
	instance_create_depth(x,y,depth,obj_epe)
}

//weapon 1 - arc
arcReach = 12
sprArme[1] = spr_bow
bowState = 1
cooldownState = 0;
cooldownRecharge = 60
if weapon == 1{
	instance_create_depth(x,y,depth,obj_arc)
}

//weapon 2 - boomerang
boomerangReach = 15
if weapon == 2{
	instance_create_depth(x,y,depth,obj_boomerang)
}