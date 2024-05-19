extends Node

var truck_position = Vector2.ZERO
var sun_position = Vector2.ZERO
onready var truck_node = get_node("Truck")
onready var tilemap = get_node("TileMap")
onready var sun_node = get_node("Sun")

func _process(delta):
	truck_position = truck_node.position
	var trucked_tile : Vector2 = tilemap.world_to_map(truck_position)
	tilemap.set_cellv(trucked_tile, 1)
	
	sun_position = sun_node.position
	var sunny_tile : Vector2 = tilemap.world_to_map(sun_position)
	tilemap.set_cellv(sunny_tile, 0)
