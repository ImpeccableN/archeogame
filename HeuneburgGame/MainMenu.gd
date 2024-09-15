extends Control

func _ready():
	var screen_pos = OS.get_window_position()
	OS.set_window_position(screen_pos + Vector2(200, 200))
	MusicPlayer.play_titletheme()
	


func _on_Start_pressed():
	MusicPlayer.stop()
	get_tree().change_scene("res://Level/Desk.tscn")


func _on_Quit_pressed():
	get_tree().quit()


func _on_Credits_pressed():
	get_tree().change_scene("res://Credits.tscn")
