//Verification of the grid
/*
if keyboard_check(vk_alt){
	mp_grid_draw(global.mp_grid)
}
*/
var xDiff = obj_camera.x - 336/2

if !animation{
//tuto
draw_set_color(c_white)
var l = 10
draw_sprite_ext(spr_affiche,0,x-60,y,110/l,40/l,0,c_white,0.8)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(fnt_pixel)
draw_text_ext_transformed(x-60,y-1,textTutoLegs[obj_legs.movementType],17,270,0.35,0.35,0)
draw_sprite_ext(spr_affiche,0,x+60,y,110/l,40/l,0,c_white,0.8)
draw_text_ext_transformed(x+60,y-1,textTutoArme[obj_man.weapon],17,270,0.35,0.35,0)

//vie
lerpVie = lerp(lerpVie,max(0,obj_man.hp/obj_man.hpMax),0.1)
draw_sprite_ext(spr_vie,1,2+xDiff,2,1,1,0,c_white,1)
draw_sprite_ext(spr_vie,0,2+xDiff,2,lerpVie,1,0,c_white,1)

if obj_boss.active == true{
lerpVieBoss = lerp(lerpVieBoss,max(0,obj_boss.hp/obj_boss.hpMax),0.1)
draw_sprite_ext(spr_vie,1,336+xDiff-2,2,-1,1,0,c_white,1)
draw_sprite_ext(spr_vie,2,336+xDiff-2,2,-lerpVieBoss,1,0,c_white,1)
}

//game ovee
if obj_man.mort == true{
	draw_set_color(c_black)
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)
	draw_text_transformed(xDiff+336/2,192/2,"Game over, better luck next life...",0.8,0.8,0)	
	draw_text_transformed(xDiff+336/2,192/2 + 20,"Press R to restart",0.7,0.7,0)	
}
if obj_boss.mort == true{
	draw_set_color(c_black)
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)
	draw_text_transformed(xDiff+336/2,192/2,"Good job! Now the world will\nfall into chaos and destruction",0.8,0.8,0)	
	draw_text_transformed(xDiff+336/2,192/2 + 40,"Press R to restart",0.7,0.7,0)
}
} else{
	draw_set_color(c_black)
	draw_set_valign(fa_top)
	draw_set_halign(fa_center)
	draw_set_font(fnt_pixel)
	draw_text_transformed(xDiff+336/2,10,textIntro[stage],0.8,0.8,0)
	draw_set_valign(fa_bottom)
	draw_text_transformed(xDiff+336/2,192-10,"Escape to skip the cutscene and Tab to enable fullscreen\nR to restart and reroll your character",0.5,0.5,0)
	dir += 0.5
	temps += 0.1
	var _xscale = -sign(dcos(dir))
	if _xscale = 0{
		_xscale = 1
	}
	draw_sprite_ext(spr_boss_idle,3,xDiff+336/2+dcos(dir)*(dist+sin(temps)*5),192/2+-dsin(dir)*(dist+sin(temps)*5),_xscale,1,0,c_white,1)
}