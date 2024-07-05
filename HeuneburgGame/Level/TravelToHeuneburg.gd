extends VideoPlayer



func _on_TravelToHeuneburg_finished():
	get_tree().change_scene("res://Level1/FirstLevel_Map.tscn")
