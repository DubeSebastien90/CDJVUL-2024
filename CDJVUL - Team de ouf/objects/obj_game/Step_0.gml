//util
if keyboard_check_pressed(vk_tab){
	window_set_fullscreen(!window_get_fullscreen())
}
if keyboard_check_released(ord("R")){
	game_restart()
}