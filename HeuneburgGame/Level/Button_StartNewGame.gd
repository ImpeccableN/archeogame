extends Button


func _physics_process(_delta):
	if Input.is_action_just_pressed("click_button"):
		hide()

func _on_Button_Start_pressed():
	get_tree().change_scene("res://Level/Desk.tscn")
