other.hp -= dammage
var moi = self
with(instance_create_depth(x,y-20,-550,obj_textShow)){
	text = string(moi.dammage)
	color = c_red
}
instance_destroy()