extends Sprite

var shovel_entered : bool = false
onready var shovel_node = get_node("../../../Schaufel")
onready var audio = get_node("../../../ShovelAudio")

signal deleted(node)

func _ready():
	var main_node = get_parent().get_parent().get_parent()
	connect("deleted", main_node, "erase_cutout")
	connect("deleted", shovel_node, "_on_ProfilkastenTool_area_exited")
	

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

func _process(_delta):
	if Input.is_mouse_button_pressed(1) and shovel_entered:
		if not audio.is_playing():
			audio.play()		
		emit_signal("deleted", self)
		get_parent().queue_free()
		
