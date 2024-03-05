if movementType == 2{
	draw_sprite_ext(spr_shadow,0,x,y+sprite_get_height(sprite_index)/2,1,1,0,c_white,0.3)
}

//dessiner le monstre
if movementType == 3{
	//snake
	for(var i = 0; i < length; i++){
		draw_sprite_ext(spr_player,movementType,prevX[i],prevY[i],xscale,yscale,rot,c_white,1)
	}
} else{
	//autres
	draw_sprite_ext(spr_player,movementType,x,y-z,xscale,yscale,rot,c_white,alpha)
}

