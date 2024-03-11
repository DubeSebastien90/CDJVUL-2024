state = states.IDLE
xp = x
yp = y
facing = 1
alert = false

//Change for different enemy
alert_dis = 160
move_speed = 0.4
atk_dis = 18
hp_max = 50
//push_force = 0.4

hp = hp_max
path = path_add()

calc_path_delay = 30
calc_path_timer = irandom(60)

hit_cooldown = 0

collisionSword = false