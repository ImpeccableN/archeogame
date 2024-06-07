extends Node2D

var minigame_scene := preload("res://Minigame1/Minigame1.tscn")
var minigame_position := Vector2(448, 192)
var started_before = false

var introduction_message = "Click \"Start\" to start the game"

func _ready():
	$Minigame1_HUD.show()
	$Minigame1_HUD.display_message(introduction_message)


func _on_StartButton_button_up():
	var minigame_instance = minigame_scene.instance()
	add_child(minigame_instance)
	minigame_instance.position = minigame_position
	$Minigame1_HUD.hide()
	$Minigame1_HUD/StartButton.disabled = true
