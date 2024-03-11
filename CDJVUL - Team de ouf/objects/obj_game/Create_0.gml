global.mp_grid = 0

x = 336/2
y = 30

//wave
nb_ennemies = 3
waveState = 0

lerpVie = 1
lerpVieBoss = 1

textTutoArme[0] = "Sword\nSwing your sword at nearby ennemies by clicking the left mouse button."
textTutoArme[1] = "Bow\nCharge you bow by pressing the left mouse button to make your arrows more powerfull."
textTutoArme[2] = "Boomerang\nSome people may say it looks like a common yellow fruit and they might be right. Throw it with the left mouse button."
textTutoArme[3] = "Bomb\nThrow them to your ennemies with the left mouse button, but watch out for the explosion dammage... it hurts."

textTutoLegs[0] = "Crab\nYou can only move in two directions with WASD, but you can change your movement axis by pressing space."
textTutoLegs[1] = "Goat\nYou are incredibly slow, but you can dash to avoid projectiles with spacebar. Move with WASD."
textTutoLegs[2] = "Fish\nYou can only change direction when you are on the ground using WASD, but it's not very effective..."
textTutoLegs[4] = "Worm\nYou can dig underground to move by pressing space and using WASD, but you can only attack while out of the ground."

enum states {
	IDLE,
	APPROACHING,
	MOVE,
	ATTACK,
	DEAD
}


animation = true
dist = 60
dir = 0
temps = 0
cooldownEventMax = 5*60
cooldownEvent = cooldownEventMax
nbStages = 4
stage = 0

textIntro[0] = "Hello creature, I am your beloved god"
textIntro[1] = "I created you by mixing parts of \nother creatures I found"
textIntro[2] = "You shall love your body as it is"
textIntro[3] = "What? You don't like it? LOL"
