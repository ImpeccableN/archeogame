extends Area2D

onready var SeriousPopUp = $Serious.texture

func _ready():
	SeriousPopUp.hide()

func _on_SeriousBusiness_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		SeriousPopUp.show()
