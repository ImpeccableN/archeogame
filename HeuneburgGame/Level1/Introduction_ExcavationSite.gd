extends TextureRect


func _ready():
	$Button_CloseIntroTxt.hide()



func _on_Button_CloseIntroTxt_pressed():
	$CloseDiary.play()
	get_tree().change_scene("res://Level1/FirstLevel_Map.tscn")
	
