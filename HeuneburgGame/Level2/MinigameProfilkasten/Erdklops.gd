extends TextureRect

var kelle_entered : bool = false
onready var kelle_node = get_node("../../Kelle")

signal deleted(node)

func _ready():
	var main_node = get_parent().get_parent()
	connect("deleted", main_node, "erase_cutout")
	connect("deleted", kelle_node, "_on_ProfilkastenTool_area_exited")


func area_entered(area):
	if "kelle" in area.get_groups():
		kelle_entered = true


func area_exited(area):
	if "kelle" in area.get_groups():
		kelle_entered = false


func _process(_delta):
	if Input.is_mouse_button_pressed(1) and kelle_entered:
		emit_signal("deleted", self)
		queue_free()
		
