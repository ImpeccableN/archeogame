extends Polygon2D

onready var node = get_node(".")
onready var clip_poly = get_node("../ClipPolygon")
var polygons_clip


func _ready():
	pass


func _input(event):
	if event is InputEventMouseButton and event.get_button_index() == 1:
		if Geometry.is_point_in_polygon(event.global_position, node.polygon):
#			var global_poly = Transform2D(0, node.global_position) * node.polygon
			var offset_poly = Polygon2D.new()
			var new_values : Array = []
			for point in clip_poly.polygon:
				new_values.append(Transform2D(0, event.global_position) * point)
			offset_poly.polygon = new_values
			var splits = Geometry.clip_polygons_2d(offset_poly.polygon, node.polygon)
			print(splits)
#		var lok_polygon : Array = []
#		for point in splits[0]:
#			lok_polygon.append(point - node.global_position)
			for poly in splits:
				if Geometry.is_polygon_clockwise(poly):
					node.polygon = poly
