extends VideoPlayer

func _ready():
	var vid_num = str(Global.teamSelect)
	if vid_num == "0":
		vid_num = "1"
	stream = load("res://video/outro" + vid_num + ".ogv")
