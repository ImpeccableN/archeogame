extends TextureRect

func _on_Button_toMap3_pressed():
	$CloseDiary.play()
	get_tree().change_scene("res://Level3/ThirdDay_Map.tscn")
