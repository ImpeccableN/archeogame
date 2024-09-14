extends Node2D

#score must be 11
onready var puzzleScore = Global.puzzlePieces

func _ready():
	$TextureRect2_puzzleFinished.hide()
	$Label.hide()
	$Button_ctn.hide()
	Global.start_timer()

func _process(_delta):
	if Global.puzzlePieces == 11:
		Global.calculate_disaster(distribute_disaster_points())
		Global.puzzle_done = true
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
		$Button_ctn.show()


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
	$Diary.show()
	$Diary/Diary_texture.show()
	$TextureRect.hide()
	$CanvasLayer.hide()
	$Label.hide()
	$Button_Tip3.hide()
	$Button_reset.hide()


func _on_Button_Close_pressed():
	$Diary/BookClose.play()
	$Diary.hide()
	$Diary/Diary_texture.hide()
	$TextureRect.show()
	$CanvasLayer.show()
	$Label.hide()
	$Button_Tip3.show()
	$Button_reset.show()
	


func _on_Button_ctn_pressed():
	get_tree().change_scene("res://Level3/DiaryLvl3End.tscn")


func distribute_disaster_points() -> int:
	var elapsed_time = Global.calculate_time()
	if elapsed_time >= 300:
		return 30
	elif elapsed_time < 300 && elapsed_time >= 240:
		return 20
	elif elapsed_time < 240 && elapsed_time >= 180:
		return 10
	else:
		return 0
