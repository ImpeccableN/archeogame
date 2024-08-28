extends Area2D


func _on_Button_Grabungsstaette_input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(1):
		get_tree().change_scene("res://Level2/MinigameProfilkasten/Main_Minigame3.tscn")
