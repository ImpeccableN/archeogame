extends Node2D

onready var score_label = $ScoreLabel

signal start_game


func _on_Minigame1_score_up(score):
	score_label.text = str(score)


func display_message(text):
	$MessageLabel.show()
	$MessageLabel.text = text


func _on_Player_hit():
	$StartButton.show()
	$StartButton.disabled = false


func _on_StartButton_button_up():
	$StartButton.hide()
	$StartButton.disabled = true
	emit_signal("start_game")
	_on_Minigame1_score_up(0)
	$MessageLabel.hide()


func _on_StartButton_pressed():
	get_tree().change_scene("res://Level2/MinigameProfilkasten/MinigameProfilkasten.tscn")
