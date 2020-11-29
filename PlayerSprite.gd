extends Sprite

func switch_tex(num):
	if(num == 1):
		self.region_rect(64,0,32,32)
	if(num == 2):
		get_node("Player/Sprite").region_rect(32,0,32,32)
	if(num == 3):
		get_node("Player/Sprite").region_rect(0,0,32,32)
