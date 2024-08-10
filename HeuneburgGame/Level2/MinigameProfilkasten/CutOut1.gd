extends TextureRect

var shovel_entered : bool = false

signal deleted(node)

func _ready():
	var main_node = get_parent().get_parent()
	connect("deleted", main_node, "erase_cutout")

func area_entered(area):
	if "schaufel" in area.get_groups():
		shovel_entered = true

func area_exited(area):
	if "schaufel" in area.get_groups():
		shovel_entered = false

#func _input(event):
#	if shovel_entered:
#		if event.is_pressed() and event.get_button_index() == 1:
#			queue_free()

func _process(delta):
	if Input.is_mouse_button_pressed(1) and shovel_entered:
		emit_signal("deleted", self)
		queue_free()
		
