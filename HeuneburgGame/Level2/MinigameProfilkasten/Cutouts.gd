extends Node2D



func _ready():
	var children: Array = get_children()
#	var imgarr
	
	
#	var i = 1
	for child in children:
		var sprite_node = child.get_child(0)
		## set mouse filter to "ignore"
#		child.mouse_filter = 2
		
		##add area2D to every cutout
#		var area = Area2D.new()
#		child.add_child(area)
		
		
		##create collisionpolygon from texture
#		var path = "res://Level2/MinigameProfilkasten/Assets/Images/bg1_cutouts_collision/bg1_cut" + str(i) + ".png"
##		var file = path.replace(".import", "")
##		print(file)
#		var image = Image.new()
#		image.load(ProjectSettings.globalize_path(path))
#
#		var bitmap = BitMap.new()
#		bitmap.create_from_image_alpha(image)
#
#		var polygons = bitmap.opaque_to_polygons(Rect2(Vector2(0, 0), bitmap.get_size()))
#
#		for polygon in polygons:
#			var collider = CollisionPolygon2D.new()
#			collider.polygon = polygon
#			area.add_child(collider)
#			collider.position = Vector2(0,0)
		
		child.set_collision_layer_bit(0, false)
		child.set_collision_layer_bit(1, true)
		child.set_collision_mask_bit(0, false)
		child.set_collision_mask_bit(1, true)
		
		child.connect("area_entered", sprite_node, "area_entered")
		child.connect("area_exited", sprite_node, "area_exited")
		
#		i += 1

func delete_cutout(_area):
#	print("true")
	pass
