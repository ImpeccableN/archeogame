extends TextureRect


func _on_DiaryLvl2_gui_input(event):
	if event.is_action("click_button"):
		get_tree().change_scene("res://Level2/SecondDay_Map.tscn")
