nbClouds = 100
cloudX[0] = 0
cloudY[0] = 0
cloudIndex[0] = 0
cloudAlpha[0] = 0
cloudScale[0] = 0
cloudSide[0] = 0

x_rendu = -200
side = 1
for (var i = 0; i < nbClouds; i++){
	x_rendu += random_range(40,60)
	cloudX[i] = x_rendu
	cloudY[i] = 192/2 + (random_range(55,192/2)*side)
	side *= -1
	cloudIndex[i] = choose(0,1,2,3)
	cloudAlpha[i] = random_range(0.7,0.9)
	cloudScale[i] = random_range(1.7,2)
	cloudSide[i] = choose(-1,1)
}