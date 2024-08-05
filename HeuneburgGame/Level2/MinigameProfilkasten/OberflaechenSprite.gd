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
	global_poly.polygon = PoolVector2Array(point_arr)
	polygon_global = global_poly


func _input(event):
	if event.is_pressed() and event.get_button_index() == 1:
#		if Geometry.is_point_in_polygon(event.position, polygon_global.polygon):
		if 1 == 1:
			clip(event)


func clip(event):
	clip_poly.global_position = event.position
	var offset_poly = Polygon2D.new()
	var new_values = []
	for point in clip_poly.polygon:
		new_values.append(Transform2D(0, clip_poly.global_position) * point)
	offset_poly.polygon = PoolVector2Array(new_values)
#	print("node polygon before: ")
#	print(node.polygon)
	var splits = Geometry.clip_polygons_2d(polygon_global.polygon, offset_poly.polygon)
#	print("Splits: ")
#	print(splits)
	var lok_polygon = []
	for point in splits[0]:
		lok_polygon.append(point - node.global_position)
#	for poly in splits[0]:
#		if Geometry.is_polygon_clockwise(poly):
	node.polygon = PoolVector2Array(lok_polygon)
	polygon_global.polygon = PoolVector2Array(splits[0])
	if splits.size() > 1:
		for point in splits[1]:
			lok_polygon.clear()
			lok_polygon.append(point - node.get_offset())
		var new_poly = Polygon2D.new()
		new_poly.polygon = PoolVector2Array(splits[1])
		new_poly.set_texture(textureload)
		new_poly.set_texture_offset(node.get_texture_offset())
		new_poly.position = node.get_offset()
		get_parent().add_child(new_poly)
		new_poly.show()
