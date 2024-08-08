extends Node2D



func _ready():
	var children: Array = get_children()
	
	for child in children:
		## set mouse filter to "ignore"
		child.mouse_filter = 2
		
		##add area2D to every cutout
		var area = Area2D.new()
		add_child(area)
		
		
		##create collisionpolygon from texture
		var path = (child.texture.resource_path)
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
		
		area.set_collision_layer_bit(0, false)
		area.set_collision_layer_bit(1, true)
		area.set_collision_mask_bit(0, false)
		area.set_collision_mask_bit(1, true)
		
		area.connect("area_entered", child, "delete_self")
		

func delete_cutout(area):
#	print("true")
	pass
