if movementType == 2{
	//fish shadow
	draw_sprite_ext(spr_shadow,0,x,y+8,1,1,0,c_white,0.3)
}else if movementType == 0{
	//crab shadow
	var _diff = 1//axis*90
	if axis == 1{
		_diff = 0.7
	}
	draw_sprite_ext(spr_shadow,0,x,y+5,_diff,1,0,c_white,0.3)	
} else if movementType == 1{
	draw_sprite_ext(spr_shadow,0,x,y+13,1.4,1,0,c_white,0.3)	
}

//dessiner le monstre
if movementType == 3{
	//snake
	//tête
	snakePiece[length].x = x 
	snakePiece[length]. y = y 
	snakePiece[length].depth = depth + 8
	//snakePiece[length].index = 6
	//queue
	snakePiece[length-1].x = prevX[length-1]+xfin
	snakePiece[length-1]. y	= prevY[length-1]+yfin
} else{
	//autres
	if movementType == 4{
		draw_sprite_ext(spr[movementType],imageIndex,x,y,xscale,yscale,rot,c_white,alpha)
	} else{
		draw_sprite_ext(spr[movementType],imageIndex,x,y-z,xscale,yscale,rot,c_white,alpha)
	}
}

