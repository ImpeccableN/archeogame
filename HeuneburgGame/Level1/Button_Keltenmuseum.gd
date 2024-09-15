extends Area2D


func _on_Button_Keltenmuseum_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		MusicPlayer.stop()
		get_tree().change_scene("res://Level3/Museum/Museum_outside.tscn")
