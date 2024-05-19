extends Node

var sun_position = Vector2.ZERO
onready var sun_node = get_node("Sun")
onready var tilemap = get_node("TileMap")

func _process(delta):
	sun_position = sun_node.position
	var sunny_tile : Vector2 = tilemap.world_to_map(sun_position)
	tilemap.set_cellv(sunny_tile, 0)
	
