extends Area2D


#checks if Input event on area is mousebuttonclick. if so change scene to minigame1
func _on_Button_Grabungsstaette_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		get_tree().change_scene("res://Minigame1/Main_Minigame1.tscn")
