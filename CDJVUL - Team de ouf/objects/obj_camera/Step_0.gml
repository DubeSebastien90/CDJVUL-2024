if camBoss == true{
	follow = self
	xTo = room_width - 336/2
} else{


//update destination
if (instance_exists(follow)) 
{
	xTo = follow.x;
	yTo = y
}
}
//offsetX = lerp(offsetX,follow.hspd*15,0.01)
//offsetY = lerp(offsetY,follow.vspd*7,0.01)

zoom_ammount = lerp(zoom_ammount,zoom_dir,zoom_lerp)
//zoom
var _camW = camW*zoom_ammount
var _camH = camH*zoom_ammount

//move camera
x += (xTo - x) / 5	
y += (yTo - y) / 5

//keep in center
//x = clamp(x,_camW/2,room_width-_camW/2)
//y = clamp(y,_camH/2,room_height-_camH/2)

//screen shake
x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);
shake_remain = max(0,shake_remain-((1/shake_lenght)*shake_magnitude));


//update camera view
camera_set_view_pos(cam,x-_camW/2,y-_camH/2);
camera_set_view_size(cam,_camW,_camH)

