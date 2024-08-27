extends Area2D


#checks if Input event on area is mousebuttonclick. if so change scene to profilkastengame
func _on_Button_Grabungsstaette_input_event(_viewport, _event, _shape_idx):
	if Input.is_mouse_button_pressed(1):
		get_tree().change_scene("res://Level2/MinigameProfilkasten/Main_Minigame3.tscn")
