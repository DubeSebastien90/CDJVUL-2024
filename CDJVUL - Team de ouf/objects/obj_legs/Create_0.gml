//initialisation
y = room_height/2
x = room_width/2

vspd = 0
hspd = 0
actualWalkspd = 0
control = true
diff = 0
lerpVal = 1

rot = 0
xscale = 1
yscale = 1
alpha = 1
imageIndex = 0

randomise()
movementType = round(random(4))

//type 0 - crab
cooldownCrabe = 0
axis = 0
walkspd_crab = 1
lerpCrab = 0.1
spr[0] = spr_crabLeg

//type 1 - bélier
spr[1] = spr_bouc
dashCooldownMax = 30
dashCooldown = 0 
dashDuration = 20
dashDurationCooldown = 0
dashX = 0
dashY = 0
walkspd_belier = 0.6
walkspd_dashBelier = 2.2
lerpBelier = 0.1

//type 2 - poisson
spr[2] = spr_poisson
dirX = 0
dirY = 0
dir = 0
z = 0
grav = 0.03
zspd = 0
diffSpd = 0
walkspd_fish = 0.65
lerpFish = 0.7

//type 3 - snake
spr[3] = spr_snake
tileSize = 16
lengthMax = 10
length = 10
cooldownMoveMaxSnake = 16
cooldownMoveSnake = 0
walkspd_snake = 1
lerpSnake = 1
prevXSnake = 0
prevYSnake = 0
xfin = 0
yfin = 0
xFinDir = 0
yFinDir = 0
if movementType == 3{
	x += 16*4
	y -= 8
}
for(var i = 0; i < lengthMax; i++){
	prevX[i] = x - 16*i
	prevY[i] = y
}

//type 4 - taupe
spr[4] = spr_taupe
dirTaupe = 0
walkspd_taupe = 1.2
lerpTaupe = 0.1
cooldownPartDirt = 0

//type 5 - girafe ???


sprite_index = spr[movementType]
