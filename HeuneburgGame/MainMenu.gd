extends Control

func _ready():
	MusicPlayer.play_titletheme()


func _on_Start_pressed():
	MusicPlayer.stop()
	get_tree().change_scene("res://Level/Level0.tscn")


func _on_Quit_pressed():
	get_tree().quit()


func _on_Credits_pressed():
	pass # Replace with function body.


