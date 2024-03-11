if !other.mort{
other.hp -= dammage
var moi = self
with(instance_create_depth(obj_man.x,obj_man.y-20,-550,obj_textShow)){
	text = string(moi.dammage)
	color = c_red
}
instance_destroy()
}