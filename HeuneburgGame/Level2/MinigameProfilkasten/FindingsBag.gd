extends Sprite

var shards_found : int = 0

var img2 = load("res://Level2/MinigameProfilkasten/Assets/Images/fundtueteMit1Scherbe.png")
var img3 = load("res://Level2/MinigameProfilkasten/Assets/Images/fundtueteMit2Scherben.png")
var img4 = load("res://Level2/MinigameProfilkasten/Assets/Images/fundtueteMit3Scherben.png")

func change_img():
	shards_found += 1
	match shards_found:
		1:
			set_texture(img2)
		2:
			set_texture(img3)
		3:
			set_texture(img4)
