extends Polygon2D

onready var node = get_node(".")
onready var clip_poly = get_node("../ClipPolygon")
var textureload = preload("res://Level2/MinigameProfilkasten/Assets/Images/polygon_texture.png")
var polygon_global : Polygon2D


func _ready():
	var point_arr = []
	for point in node.polygon:
		point_arr.append(Transform2D(0, node.global_position) * point)
	var global_poly = Polygon2D.new()
	global_poly.polygon = point_arr
	polygon_global = global_poly


func _input(event):
	if event.is_pressed() and event.get_button_index() == 1:
		if Geometry.is_point_in_polygon(event.position, polygon_global.polygon):
			var offset_poly = Polygon2D.new()
			var new_values : Array = []
			for point in clip_poly.polygon:
				new_values.append(Transform2D(0, event.position) * point)
			offset_poly.polygon = new_values
			print("node polygon before: ")
			print(node.polygon)
			var splits = Geometry.clip_polygons_2d(node.polygon, offset_poly.polygon)
			print("Splits: ")
			print(splits)
#		var lok_polygon : Array = []
#		for point in splits[0]:
#			lok_polygon.append(point - node.global_position)
#			for poly in splits:
#				if Geometry.is_polygon_clockwise(poly):
			node.polygon = splits[0]
			print("node polygon after: ")
			print(node.polygon)
			node.texture = textureload
