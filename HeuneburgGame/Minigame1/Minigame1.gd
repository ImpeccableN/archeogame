extends Node2D

var truck_position = Vector2.ZERO
var sun_position = Vector2.ZERO
var sun_direction = false
var marker_scene = preload("res://Minigame1/Marker.tscn")
var score = 0
var cell_array : Array
var artefact_array : Array
var artefact_cell_array = [5, 6, 7, 8, 9]
var artefact_cell_numb = 0
var tilemap_border := Vector2(16, 9)
var game_over_message = "Game  Over.  Want  to  try  again?"
onready var truck_node = get_node("Truck")
onready var tilemap = get_node("TileMap")
onready var sun_node = get_node("Sun")

signal score_up(score)

func _ready():
	cell_array = tilemap.get_used_cells()
	$Minigame1_HUD/StartButton.hide()
	$Minigame1_HUD/StartButton.disabled = true


func _process(delta):
	truck_position = truck_node.position
	var trucked_tile : Vector2 = tilemap.world_to_map(truck_position)
	if tilemap.get_cellv(trucked_tile) == 3:
		tilemap.set_cellv(trucked_tile, 4)
	
	sun_position = sun_node.position
	var sunny_tile : Vector2 = tilemap.world_to_map(sun_position)
	if sunny_tile.x < tilemap_border.x && sunny_tile.x >= 0 && sunny_tile.y < tilemap_border.y && sunny_tile.y >= 0:
		tilemap.set_cellv(sunny_tile, 3)
#	if sun_direction == false:
#		tilemap.set_cellv((sunny_tile)+Vector2(1,1) , 0)
#		tilemap.set_cellv((sunny_tile)-Vector2(1,1) , 0)
#	else:
#		tilemap.set_cellv((sunny_tile)+Vector2(-1,1) , 0)
#		tilemap.set_cellv((sunny_tile)-Vector2(-1,1) , 0)


func _on_ArtefactSpawnTimer_timeout():
	truck_position = truck_node.position
	var artefact_tile : Vector2 = tilemap.world_to_map(truck_position)
	RandomNumberGenerator
	tilemap.set_cellv(artefact_tile, artefact_cell_randomizer())


func artefact_cell_randomizer():
	if artefact_cell_numb == 4:
		artefact_cell_array.shuffle()
		artefact_cell_numb = 0
	else :
		artefact_cell_numb += 1
	return artefact_cell_array[artefact_cell_numb]


func _on_Sun_direction_change():
	sun_direction = not sun_direction


func _on_Player_set_marker(player_position):
	var player_tile : Vector2 = tilemap.world_to_map(player_position)
	if tilemap.get_cellv(player_tile) in artefact_cell_array:
		var marker_instace = marker_scene.instance()
		add_child(marker_instace)
		artefact_array.append(marker_instace)
		marker_instace.position = tilemap.map_to_world(player_tile) + Vector2(32, 32)
		score += 1
		emit_signal("score_up", score)


func _on_Player_hit():
	$Truck/CollisionShape2D.set_deferred("disabled", true)
	$Sun/CollisionShape2D.set_deferred("disabled", true)
	$Truck.speed = 0
	$ArtefactSpawnTimer.stop()
	$Minigame1_HUD.show()
	$Minigame1_HUD.display_message(game_over_message)
	


func _on_Minigame1_HUD_start_game():
	# set all tilemap cells back to dryland tiles
	for cell in cell_array:
		tilemap.set_cellv(cell, 3)
	#delete all markers on map
	for artefact in artefact_array:
		artefact.queue_free()
	artefact_array.clear()
	score = 0
	$Truck/CollisionShape2D.disabled = false
	$Sun/CollisionShape2D.disabled = false
	$ArtefactSpawnTimer.start()
	
