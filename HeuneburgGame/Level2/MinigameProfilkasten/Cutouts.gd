extends Node2D



func _ready():
	var children: Array = get_children()
	
	for child in children:
		child.mouse_filter = 2
		var area = Area2D.new()
		add_child(area)
		var path = (child.texture.resource_path)
		var image = Image.new()
		image.load(path)

		var bitmap = BitMap.new()
		bitmap.create_from_image_alpha(image)

		var polygons = bitmap.opaque_to_polygons(Rect2(Vector2(0, 0), bitmap.get_size()))

		for polygon in polygons:
			var collider = CollisionPolygon2D.new()
			collider.polygon = polygon
			area.add_child(collider)
			collider.position = Vector2(0,0)
		
		area.connect("area_entered", self, "delete_cutout")
		

func delete_cutout(area):
	print("true")
