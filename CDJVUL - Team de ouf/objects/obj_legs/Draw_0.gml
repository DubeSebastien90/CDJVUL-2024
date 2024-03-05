if movementType == 2{
	//fish shadow
	draw_sprite_ext(spr_shadow,0,x,y+sprite_get_height(sprite_index)/2,1,1,0,c_white,0.3)
}else if movementType == 0{
	//crab shadow
	var _diff = 0//axis*90
	draw_sprite_ext(spr_shadow,0,x,y+5,1,1,_diff,c_white,0.3)	
}

//dessiner le monstre
if movementType == 3{
	//snake
	//tête
	snakePiece[length].x = x 
	snakePiece[length]. y = y 
	snakePiece[length].depth = depth + 16
	//queue
	snakePiece[length-1].x = prevX[length-1]+xfin
	snakePiece[length-1]. y = prevY[length-1]+yfin
} else{
	//autres
	draw_sprite_ext(spr[movementType],imageIndex,x,y-z,xscale,yscale,rot,c_white,alpha)
}

