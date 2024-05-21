extends Node

var truck_position = Vector2.ZERO
var sun_position = Vector2.ZERO
var sun_direction = true
onready var truck_node = get_node("Truck")
onready var tilemap = get_node("TileMap")
onready var sun_node = get_node("Sun")
export (PackedScene) var artefact_scene

func _process(delta):
	truck_position = truck_node.position
	var trucked_tile : Vector2 = tilemap.world_to_map(truck_position)
	tilemap.set_cellv(trucked_tile, 1)
	
	sun_position = sun_node.position
	var sunny_tile : Vector2 = tilemap.world_to_map(sun_position)
	tilemap.set_cellv(sunny_tile, 0)
	if sun_direction == false:
		tilemap.set_cellv((sunny_tile)+Vector2(1,1) , 0)
		tilemap.set_cellv((sunny_tile)-Vector2(1,1) , 0)
	else:
		tilemap.set_cellv((sunny_tile)+Vector2(-1,1) , 0)
		tilemap.set_cellv((sunny_tile)-Vector2(-1,1) , 0)
	
	


func _on_ArtefactSpawnTimer_timeout():
	truck_position = truck_node.position
	var artefact_tile : Vector2 = tilemap.world_to_map(Vector2(truck_position.x -50, truck_position.y))
	tilemap.set_cellv(artefact_tile, 2)



func _on_Sun_direction_change():
	sun_direction = not sun_direction
