extends Area2D



func _on_Button_Grabungsstaette_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		print("clicekdiclick")
