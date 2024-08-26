extends TextureRect

onready var score = Global.scoreApplication

func _ready():
	hide()
	
func _on_ContinueButton_pressed():
	show()
	
	
func get_drag_data(_pos):
	#Retrieve information about the slot we are dragging
	var data = {}
	
	
	var drag_texture = TextureRect.new()
	drag_texture.expand = true
	drag_texture.texture = texture
	drag_texture.rect_size = Vector2(100, 100)
	
	var control = Control.new()
	control.add_child(drag_texture)
	drag_texture.rect_position = -0.5 * drag_texture.rect_size
	set_drag_preview(control)
	
	return data


func can_drop_data(_pos, data):
	#Check if we can drop an item in this slot
	return true


func drop_data(_pos, data):
	#When we drop an item in this slot, texture changes & continue button shows
	texture = data["origin_texture"]
	$"../../../../VBoxContainer_answerfield/ContinueButton".show()
	if $".".texture == $"../../../../VBoxContainer_answerfield/Answer3".texture:
		Global.scoreApplication += 1
		print(Global.scoreApplication)
