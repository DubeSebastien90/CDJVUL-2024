active = false
attackPhase = 0
hpMax = 500
hp = hpMax
hit_cooldown = 0

collisionSword = false

mort = false
//attaques
dureChargeAttaque = 180
cooldownAttack = dureChargeAttaque
waitBetween = 60
waitTime = waitBetween
attackRendu = 0
//jump
jump = false
vspd = 0
grav = 0.1
newDest = false
xShadow = x
yShadow = y
y_to = y
radiusExpl = 40

dmgExpl = 40
dmgEclairGros = 25
dmgEclairPetit = 10

for (var i = 0; i < 8; i++){
	dirEclair[i] = i*45
}

function mortAnim(){
	mort = true
	image_index = 4
}