cam = view_camera[0]; 
follow = self
x = room_width/2; 
y = room_height/2; 
shake_lenght = 0; 
shake_magnitude = 6; 
shake_remain = 6;
camH = camera_get_view_height(cam)
camW =camera_get_view_width(cam)

zoom_dir = 1
zoom_ammount = 1
zoom_lerp = 0.1

offsetX = 0
offsetY = 0

posX = x
posY = y
transition = false