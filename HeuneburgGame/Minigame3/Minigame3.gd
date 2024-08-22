extends Node2D

onready var puzzleScore = Global.puzzlePieces
#score must be 11

func _ready():
	$TextureRect2_puzzleFinished.hide()
	$Label.hide()

func _process(_delta):
	if Global.puzzlePieces == 11:
		$TextureRect2_puzzleFinished.show()
		$Label.show()
		$CanvasLayer/Control/piece2_target.hide()
		$CanvasLayer/Control/piece3_target.hide()
		$CanvasLayer/Control/piece4_target.hide()
		$CanvasLayer/Control/piece5_target.hide()
		$CanvasLayer/Control/piece7_target.hide()
		$CanvasLayer/Control/piece8_target.hide()
		$CanvasLayer/Control/piece9_target.hide()
		$CanvasLayer/Control/piece10_target.hide()
		$CanvasLayer/Control/piece11_target.hide()
		$CanvasLayer/Control/piece12_target.hide()
		$CanvasLayer/Control/piece13_target.hide()


func _on_Button_Tip3_pressed():
	$Tip3.show()
	yield(get_tree().create_timer(5.0), "timeout")
	$Tip3.hide()


func _on_Button_reset_pressed():
	get_tree().reload_current_scene()
	$TextureRect2_puzzleFinished.hide()
	$Label.hide()
	Global.puzzlePieces = 0


func _on_Button_Diary_pressed():
	get_tree().change_scene("res://Level/Tg_Lesezeichen.tscn")
