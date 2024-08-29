extends Sprite

var futterkelle_entered : bool = false
#var collider_arr : Array
onready var parent_node = get_parent()

signal collect_earth
signal show_earthheap

func _ready():
	hide()
	
#	mouse_filter = 2
	
###add area2D to every cutout
#	var area = Area2D.new()
#	add_child(area)
#
#
#	##create collisionpolygon from texture
#	var path = (texture.resource_path)
#	var image = Image.new()
#	image.load(ProjectSettings.globalize_path(path))
#
#	var bitmap = BitMap.new()
#	bitmap.create_from_image_alpha(image)
#
#	var polygons = bitmap.opaque_to_polygons(Rect2(Vector2(0, 0), bitmap.get_size()))
#
#	for polygon in polygons:
#		var collider = CollisionPolygon2D.new()
#		collider.polygon = polygon
#		area.add_child(collider)
#		collider.position = Vector2(0,0)
#		collider.set_disabled(true)
#		collider_arr.append(collider)
#
#	area.set_collision_layer_bit(0, false)
#	area.set_collision_layer_bit(3, true)
#	area.set_collision_mask_bit(0, false)
#	area.set_collision_mask_bit(3, true)
	
	parent_node.connect("area_entered", self, "area_entered")
	parent_node.connect("area_exited", self, "area_exited")


func area_entered(area):
	if "futterkelle" in area.get_groups():
		futterkelle_entered = true


func area_exited(area):
	if "futterkelle" in area.get_groups():
		futterkelle_entered = false


func _input(_event):
	if futterkelle_entered and Input.is_mouse_button_pressed(1):
		hide()
		
		parent_node.get_child(1).set_deferred("disabled", true)
		emit_signal("collect_earth")


func initiate(_node):
	parent_node.get_child(1).set_disabled(false)
	emit_signal("show_earthheap")
	show()
