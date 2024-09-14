extends VideoPlayer


func _ready():
	$"../continueGame".hide()
	MusicPlayer.play_applicationmusic()

func _on_Cutscene_ApplicationAccepted_finished():
	$"../continueGame".show()

func _on_continueGame_pressed():
	MusicPlayer.stop()
	get_tree().change_scene("res://Level/TeamSelection.tscn")
