//initialisation
y = room_height/2
x = 336/2

vspd = 0
hspd = 0
actualWalkspd = 0
control = false
diff = 0
lerpVal = 1

rot = 0
xscale = 1
yscale = 1
alpha = 1
imageIndex = 0

randomise()
movementType = choose(0,1,2,4)

//type 0 - crab
cooldownCrabe = 0
axis = 0
walkspd_crab = 1
lerpCrab = 0.1
spr[0] = spr_crabLeg
z = 0
gravCrabe = 0.1
zspd = 0

//type 1 - bélier
spr[1] = spr_bouc
dashCooldownMax = 60
dashCooldown = 0 
dashDuration = 20
dashDurationCooldown = 0
dashX = 0
dashY = 0
walkspd_belier = 0.4
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
for(var i = 0; i < lengthMax + 1; i++){
	prevX[i] = x - 16*i
	prevY[i] = y
	snakePiece[i] = instance_create_depth(x-16*i,7,depth,obj_bout_serpent)
	snakePiece[i].index = 0
	snakePiece[i]._i = i
}
snakePiece[0].sprite_index = noone
snakePiece[length-1].index = 11
function getIndexSerpent(_i){
	var _index = 0
	if _i == length{
		//torse
		if snakePiece[0].y == snakePiece[length].y{
			if prevXSnake == -1{
				_index = 8
			} else _index = 6
		} else{
			if prevYSnake == -1{
				_index = 9
			} else _index = 7
		}
	} else if _i == length - 1{
		//queue
	} else {
		var val = 0
		if _i == 0{
			val = length
		} else val = _i-1
		//côté
		if snakePiece[_i].x == snakePiece[_i+1].x && snakePiece[_i].x == snakePiece[val].x{
			_index = 1
		} else if snakePiece[_i].x == snakePiece[_i+1].x && snakePiece[_i].x < snakePiece[val].x{
			_index = 5
		} else if snakePiece[_i].x == snakePiece[_i+1].x && snakePiece[_i].x > snakePiece[val].x{
			_index = 3
		} else if snakePiece[_i].y == snakePiece[_i+1].y && snakePiece[_i].y > snakePiece[val].y{
			_index = 4
		} else if snakePiece[_i].y == snakePiece[_i+1].y && snakePiece[_i].y < snakePiece[val].y{
			_index = 2
		}
	}
	return _index
}

//type 4 - taupe
spr[4] = spr_taupe
dirTaupe = 0
walkspd_taupe = 1.2
lerpTaupe = 0.1
cooldownPartDirt = 0

//type 5 - girafe ???


sprite_index = spr[movementType]
bossStart = false
xToGo = 0
function startBoss(){
	obj_son.switch_music()
	xToGo = x + 40
	control = false
	bossStart = true
	obj_camera.camBoss = true
	with(obj_door){
		if doorId == 2{
			open = false
		}
	}
}
