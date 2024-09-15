extends Area2D



func _on_Button_Bauwagen3_input_event(viewport, event, shape_idx):
	if not Global.game_finished:
		if event is InputEventMouseButton and event.is_pressed():
			MusicPlayer.stop()
			get_tree().change_scene("res://Level3/Minigame3/Minigame3.tscn")
