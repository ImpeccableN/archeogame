extends Area2D


onready var DIYPopUp = $DIY.texture

func _on_DIYArcheology_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		DIYPopUp.show()
