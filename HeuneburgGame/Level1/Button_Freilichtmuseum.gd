extends Area2D


func _on_Button_Freilichtmuseum_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		MusicPlayer.stop()
		get_tree().change_scene("res://Level3/Freilichtmuseum.tscn")
