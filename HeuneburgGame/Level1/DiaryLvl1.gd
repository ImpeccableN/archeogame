extends TextureRect



func _on_DiaryLvl1_gui_input(event):
	if event.is_action("click_button"):
		get_tree().change_scene("res://Level1/FirstLevel_Map.tscn")
