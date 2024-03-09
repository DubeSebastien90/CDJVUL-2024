draw_sprite_ext(spr_background,0,-100,-100,room_width+100,room_height+100,0,c_white,1)

for (var i = 0; i < nbClouds; i++){
	draw_sprite_ext(spr_cloud,cloudIndex[i],cloudX[i]+(obj_camera.x/3), cloudY[i],cloudScale[i]*cloudSide[i],cloudScale[i],0,c_white,cloudAlpha[i])
}