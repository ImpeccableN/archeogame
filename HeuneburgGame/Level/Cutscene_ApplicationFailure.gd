extends VideoPlayer


func _ready():
	$"../redoApplication".hide()

func _on_Cutscene_ApplicationFailure_finished():
	$"../redoApplication".show()

func _on_redoApplication_pressed():
	get_tree().change_scene("res://Level/ComputerMonitor.tscn")
