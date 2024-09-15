extends Control

func _ready():
	var screen_pos = OS.get_window_position()
	OS.set_window_position(screen_pos + Vector2(200, 200))
	MusicPlayer.play_titletheme()
	


func _on_Start_pressed():
	MusicPlayer.stop()
	Global.scoreApplication = 0
	Global.minigame_digger_done = false
	Global.minigame_werkzeuge_done = false
	Global.profilkasten_done = false
	Global.puzzle_done = false
	Global.puzzlePieces = 0
	Global.game_finished = false
	Global.disaster_score = 0
	Global.old_score = 0
	get_tree().change_scene("res://Level/Desk.tscn")


func _on_Quit_pressed():
	get_tree().quit()


func _on_Credits_pressed():
	get_tree().change_scene("res://Credits.tscn")
