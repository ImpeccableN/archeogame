extends Area2D



func _on_Button_Bauwagen3_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		get_tree().change_scene("res://Minigame3/Minigame3.tscn")
