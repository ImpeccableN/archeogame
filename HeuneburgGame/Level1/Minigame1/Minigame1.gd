extends Node2D

var truck_position = Vector2.ZERO
var sun_position = Vector2.ZERO
var sun_direction = false
var marker_scene = preload("res://Level1/Minigame1/Marker.tscn")
var score = 0
var truck_stopped = false
var score_goal = 10
var cell_array_ground : Array
var marker_array : Array
var artefact_cell_array = [5, 6, 7, 8, 9]
var artefact_cell_numb = 0
var placed_artefacts : Array
var tilemap_border := Vector2(16, 17)
var game_over_message = "Game  Over.  Want  to  try  again?"
var success_message = "You did it. Now get out of here"
onready var truck_node = get_node("Truck")
onready var tilemap_ground = get_node("TileMap_Ground")
onready var tilemap_artefacts = get_node("TileMap_Artefacts")
onready var sun_node = get_node("Sun")

signal score_up(score)

func _ready():
	cell_array_ground = tilemap_ground.get_used_cells()
	
	$Minigame1_HUD/StartButton.hide()
	$Minigame1_HUD/StartButton.disabled = true


func _process(_delta):
	truck_position = truck_node.position
	var trucked_tile : Vector2 = tilemap_ground.world_to_map(truck_position)
	if tilemap_ground.get_cellv(trucked_tile) != 4:
		tilemap_ground.set_cellv(trucked_tile, 4)
	
	sun_position = sun_node.position
	var sunny_tile : Vector2 = tilemap_ground.world_to_map(sun_position)
	var sunny_art_tile : Vector2 = tilemap_artefacts.world_to_map(sun_position)
	if sunny_tile.x < tilemap_border.x && sunny_tile.x >= 0 && sunny_tile.y < tilemap_border.y && sunny_tile.y >= 0:
		if tilemap_ground.get_cellv(sunny_tile) != 10:
			tilemap_ground.set_cellv(sunny_tile, 3)
			tilemap_artefacts.set_cellv(sunny_tile, -1)
		if sunny_art_tile in placed_artefacts:
			placed_artefacts.erase(sunny_art_tile)
			if placed_artefacts.empty() and truck_stopped:
				success()
#	if sun_direction == false:
#		tilemap.set_cellv((sunny_tile)+Vector2(1,1) , 0)
#		tilemap.set_cellv((sunny_tile)-Vector2(1,1) , 0)
#	else:
#		tilemap.set_cellv((sunny_tile)+Vector2(-1,1) , 0)
#		tilemap.set_cellv((sunny_tile)-Vector2(-1,1) , 0)


func _on_ArtefactSpawnTimer_timeout():
	truck_position = truck_node.position
	var artefact_tile : Vector2 = tilemap_artefacts.world_to_map(truck_position)
	tilemap_artefacts.set_cellv(artefact_tile, artefact_cell_randomizer())
	placed_artefacts.append(artefact_tile)


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
	var player_tile : Vector2 = tilemap_artefacts.world_to_map(player_position)
	if tilemap_artefacts.get_cellv(player_tile) in artefact_cell_array:
		$Player/AudioPlayer.play()
		var marker_instance = marker_scene.instance()
		add_child(marker_instance)
		marker_array.append(marker_instance)
		marker_instance.position = tilemap_artefacts.map_to_world(player_tile) + Vector2(32, 32)
		placed_artefacts.erase(player_tile)
		score += 1
		emit_signal("score_up", score)
		if placed_artefacts.empty() and truck_stopped:
			success()
	
#	if score == score_goal:
#		success()


func _on_Player_hit():
	if score < score_goal:
		$Truck/CollisionShape2D.set_deferred("disabled", true)
		$Sun/CollisionShape2D.set_deferred("disabled", true)
		$Truck/AudioTruck.stop()
		$Truck.speed = 0
		$Sun.speed = 0
		$ArtefactSpawnTimer.stop()
		$Minigame1_HUD.show()
		$Minigame1_HUD.display_message(game_over_message)
	else:
		success()


func success():
	$Truck/AudioTruck.stop()
	$Truck/CollisionShape2D.set_deferred("disabled", true)
	$Sun/CollisionShape2D.set_deferred("disabled", true)
	$Player.hide()
	disaster_points()
	$Truck.speed = 0
	$Sun.speed = 0
	$ArtefactSpawnTimer.stop()
	$Minigame1_HUD.show()
	$Minigame1_HUD/StartButton.hide()
	$Minigame1_HUD.display_message(success_message)
	$Truck/AudioTruck.stop()
	$AudioSuccess.play()
	Global.minigame_digger_done = true
	$Minigame1_HUD/LeaveButton.show()


func _on_Minigame1_HUD_start_game():
	# set all tilemap cells back to dryland tiles
	for cell in cell_array_ground:
		tilemap_ground.set_cellv(cell, 10)
	var cell_array_artefacts = tilemap_artefacts.get_used_cells()
	for cell in cell_array_artefacts:
		tilemap_artefacts.set_cellv(cell, -1)
	#delete all markers on map
	for marker in marker_array:
		marker.queue_free()
	marker_array.clear()
	placed_artefacts.clear()
	score = 0
	truck_stopped = false
	$Truck/CollisionShape2D.disabled = false
	$Sun/CollisionShape2D.disabled = false
	$ArtefactSpawnTimer.start()


func _on_LeaveButton_pressed():
	get_tree().change_scene("res://Level1/FirstLevel_Map.tscn")


func _on_Truck_truck_stopped():
	truck_stopped = true
	$ArtefactSpawnTimer.stop()


func disaster_points():
	var disaster_score
	if score == 10:
		disaster_score = 30
	elif score >= 11 && score <= 15:
		disaster_score = 20
	elif score >= 16 && score <= 19:
		disaster_score = 10
	elif score >= 20:
		disaster_score = 0
	Global.calculate_disaster(disaster_score)