check_for_player()

if hp <= 0 {
	obj_game.nb_ennemies -= 1
	instance_destroy()
}
depth = -bbox_bottom

hit_cooldown -= 1