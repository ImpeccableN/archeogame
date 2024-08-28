extends Area2D


func _on_Button_Keltenmuseum_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		get_tree().change_scene("res://Keltenmuseum.tscn")
