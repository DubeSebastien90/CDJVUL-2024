rot += rotSpeed

spd -= 0.002
if spd < 0{
	spd = 0
}
x += (dcos(dir)*spd) 
y += (-dsin(dir)*spd) 

vie -= 1
image_alpha = vie/vieMax
if vie < 0{
	instance_destroy()
}

scale = lerp(scale,3,0.1)
