if movementType == 2{
	draw_sprite_ext(spr_shadow,0,x,y+sprite_get_height(sprite_index)/2,1,1,0,c_white,0.3)
}

//dessiner le monstre
if movementType == 3{
	//snake
	for(var i = 0; i < length - 1; i++){
		//draw_sprite_ext(spr[movementType],0,prevX[i],prevY[i],xscale,yscale,rot,c_white,1)
		
	}
	//tête
	snakePiece[length].x = x 
	snakePiece[length]. y = y 
	snakePiece[length].depth = depth + 16
	
	snakePiece[length-1].x = prevX[length-1]+xfin
	snakePiece[length-1]. y = prevY[length-1]+yfin
	//snakePiece[length-1].depth = 
	//draw_sprite_ext(spr[movementType],0,x,y,xscale,yscale,rot,c_white,1)
	//fin
	//draw_sprite_ext(spr[movementType],0,prevX[length-1]+xfin,prevY[length-1]+yfin,xscale,yscale,rot,c_white,1)
} else{
	//autres
	draw_sprite_ext(spr[movementType],imageIndex,x,y-z,xscale,yscale,rot,c_white,alpha)
}

