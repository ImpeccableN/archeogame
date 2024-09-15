extends Control

func _ready():
	MusicPlayer.play_titletheme()


func _on_Start_pressed():
	MusicPlayer.stop()
	get_tree().change_scene("res://Level/Desk.tscn")


func _on_Quit_pressed():
	get_tree().quit()


func _on_Credits_pressed():
	get_tree().change_scene("res://Credits.tscn")
