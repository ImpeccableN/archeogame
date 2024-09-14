extends Area2D


#checks if Input event on area is mousebuttonclick. if so change scene to minigame1
func _on_Button_Grabungsstaette_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		if not Global.minigame_digger_done:
			MusicPlayer.stop()
			get_tree().change_scene("res://Level1/Minigame1/Main_Minigame1.tscn")
