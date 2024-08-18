extends TextureRect

var futterkelle_entered : bool = false
var collider_arr : Array

func _ready():
	mouse_filter = 2
	
##add area2D to every cutout
	var area = Area2D.new()
	add_child(area)
	
	
	##create collisionpolygon from texture
	var path = (texture.resource_path)
	var image = Image.new()
	image.load(ProjectSettings.globalize_path(path))

	var bitmap = BitMap.new()
	bitmap.create_from_image_alpha(image)

	var polygons = bitmap.opaque_to_polygons(Rect2(Vector2(0, 0), bitmap.get_size()))

	for polygon in polygons:
		var collider = CollisionPolygon2D.new()
		collider.polygon = polygon
		area.add_child(collider)
		collider.position = Vector2(0,0)
		collider_arr.append(collider)
	
	area.set_collision_layer_bit(0, false)
	area.set_collision_layer_bit(3, true)
	area.set_collision_mask_bit(0, false)
	area.set_collision_mask_bit(3, true)
	
	area.connect("area_entered", self, "area_entered")
	area.connect("area_exited", self, "area_exited")


func area_entered(area):
	if "futterkelle" in area.get_groups():
		futterkelle_entered = true


func area_exited(area):
	if "futterkelle" in area.get_groups():
		futterkelle_entered = false


func _input(event):
	if futterkelle_entered and Input.is_mouse_button_pressed(1):
		hide()
		for collider in collider_arr:
			collider.set_disabled(true)


func initiate():
	for collider in collider_arr:
			collider.set_disabled(true)
	
	show()
