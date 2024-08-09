extends TextureRect

var shovel_entered : bool = false

func area_entered(area):
	if "schaufel" in area.get_groups():
		shovel_entered = true

func area_exited(area):
	if "schaufel" in area.get_groups():
		shovel_entered = false

func _input(event):
	if shovel_entered:
		if event.is_pressed() and event.get_button_index() == 1:
			queue_free()
