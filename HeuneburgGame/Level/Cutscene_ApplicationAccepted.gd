extends VideoPlayer


func _ready():
	$"../continueGame".hide()

func _on_Cutscene_ApplicationAccepted_finished():
	$"../continueGame".show()

func _on_continueGame_pressed():
	get_tree().change_scene("res://Level/TeamSelection.tscn")
