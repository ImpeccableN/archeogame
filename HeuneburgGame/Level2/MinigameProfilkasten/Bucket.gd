extends Sprite

var dirt_collected: int = 0

var img2 = load("res://Level2/MinigameProfilkasten/Assets/Images/EimerKrankVoll.png")
var img3 = load("res://Level2/MinigameProfilkasten/Assets/Images/EimerMidiVoll.png")
var img4 = load("res://Level2/MinigameProfilkasten/Assets/Images/EimerMiniVoll.png")

func change_img():
	dirt_collected += 1
	match dirt_collected:
		1:
			set_texture(img2)
		3:
			set_texture(img3)
		5:
			set_texture(img4)
