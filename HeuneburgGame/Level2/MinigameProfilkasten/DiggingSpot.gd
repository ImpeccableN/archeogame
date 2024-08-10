extends TextureRect

var preloadDiggedImg = preload("res://Level2/MinigameProfilkasten/Assets/Images/diggedSpot.PNG")

func _ready():
	var node = get_node(".")
	node.connect("gui_input", self, "on_shovel_click")


func on_shovel_click(event):
	if event is InputEventMouseButton and event.get_button_index() == 1:
		texture = preloadDiggedImg
