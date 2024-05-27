extends Node

var truck_position = Vector2.ZERO
var sun_position = Vector2.ZERO
var sun_direction = true
var marker_scene = preload("res://Minigame1/Marker.tscn")
var score = 0
onready var truck_node = get_node("Truck")
onready var tilemap = get_node("TileMap")
onready var sun_node = get_node("Sun")

signal score_up(score)

func _process(delta):
	truck_position = truck_node.position
	var trucked_tile : Vector2 = tilemap.world_to_map(truck_position)
	if tilemap.get_cellv(trucked_tile) == 0:
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
	var artefact_tile : Vector2 = tilemap.world_to_map(truck_position)
	tilemap.set_cellv(artefact_tile, 2)
#	var artefact_instance = artefact_scene.instance()
#	add_child(artefact_instance)
#	artefact_instance.position = truck_position


func _on_Sun_direction_change():
	sun_direction = not sun_direction


func _on_Player_set_marker(player_position):
	var player_tile : Vector2 = tilemap.world_to_map(player_position)
	if tilemap.get_cellv(player_tile) == 2:
		var marker_instace = marker_scene.instance()
		add_child(marker_instace)
		marker_instace.position = tilemap.map_to_world(player_tile) + Vector2(32, 32)
		score += 1
		emit_signal("score_up", score)


func _on_Player_hit():
	pass # Replace with function body.
