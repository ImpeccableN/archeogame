extends VideoPlayer


func _ready():
	$"../redoApplication".hide()
	MusicPlayer.play_applicationmusic()

func _on_Cutscene_ApplicationFailure_finished():
	$"../redoApplication".show()

func _on_redoApplication_pressed():
	MusicPlayer.stop()
	get_tree().change_scene("res://Level/ComputerMonitor.tscn")
