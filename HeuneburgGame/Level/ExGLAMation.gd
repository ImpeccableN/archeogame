extends Area2D

onready var ExGlamPopUp = $ExGLAM.texture

func _ready():
	ExGlamPopUp.hide()

func _on_ExGLAMation_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		ExGlamPopUp.show()
