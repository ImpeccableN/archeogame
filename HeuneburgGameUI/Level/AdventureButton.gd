extends Button


func _physics_process(delta):
	if Input.is_action_just_pressed("accept"):
		hide()

func _on_Button_pressed():
	get_tree().change_scene("res://Level/TeamSelection.tscn")
