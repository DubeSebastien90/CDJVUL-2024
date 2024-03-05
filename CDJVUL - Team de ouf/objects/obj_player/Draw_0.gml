if movementType == 2{
	draw_sprite_ext(spr_shadow,0,x,y+sprite_get_height(sprite_index)/2,1,1,0,c_white,0.3)
}

draw_sprite_ext(spr_player,movementType,x,y-z,xscale,yscale,rot,c_white,alpha)
