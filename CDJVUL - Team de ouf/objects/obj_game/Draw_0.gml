//Verification of the grid
/*
if keyboard_check(vk_alt){
	mp_grid_draw(global.mp_grid)
}
*/
var xDiff = obj_camera.x - 336/2


//draw_text(0+xDiff,10,"HELLLO")

//tuto
var l = 10
draw_sprite_ext(spr_affiche,0,x-60,y,110/l,40/l,0,c_white,0.8)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(fnt_pixel)
draw_text_ext_transformed(x-60,y-1,textTutoLegs[obj_legs.movementType],17,270,0.35,0.35,0)
draw_sprite_ext(spr_affiche,0,x+60,y,110/l,40/l,0,c_white,0.8)
draw_text_ext_transformed(x+60,y-1,textTutoArme[obj_man.weapon],17,270,0.35,0.35,0)

